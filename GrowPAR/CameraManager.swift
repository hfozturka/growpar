
import AVFoundation
import UIKit

struct Measurement: Identifiable, Codable {
    let id: UUID
    let date: Date
    let ppfd: Double
    let lux: Double
    let cct: Double
    let dli: Double
    let lightSource: String
    let plantName: String?
    
    init(ppfd: Double, lux: Double, cct: Double, dli: Double,
         lightSource: String, plantName: String?) {
        self.id = UUID()
        self.date = Date()
        self.ppfd = ppfd
        self.lux = lux
        self.cct = cct
        self.dli = dli
        self.lightSource = lightSource
        self.plantName = plantName
    }
}

class CameraManager: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var ppfd: Double = 0
    @Published var lux: Double = 0
    @Published var cct: Double = 0
    @Published var dli: Double = 0
    @Published var isRunning: Bool = false
    @Published var permissionGranted: Bool = false
    @Published var measurements: [Measurement] = []
    
    private var captureSession: AVCaptureSession?
    private var videoOutput = AVCaptureVideoDataOutput()
    private let sessionQueue = DispatchQueue(label: "camera.session")
    
    var photoperiod: Double = 16.0
    var calibrationFactor: Double = {
        let saved = UserDefaults.standard.double(forKey: "calibrationFactor")
        return saved == 0 ? 1.112 : saved
    }()
    var luxToPPFDFactor: Double = 0.0185
    
    override init() {
        super.init()
        loadMeasurements()
    }
    
    func requestPermissionAndStart() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            startSession()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    self?.permissionGranted = granted
                    if granted { self?.startSession() }
                }
            }
        default:
            DispatchQueue.main.async { self.permissionGranted = false }
        }
    }
    
    func startSession() {
        sessionQueue.async { [weak self] in
            guard let self = self else { return }
            let session = AVCaptureSession()
            session.sessionPreset = .medium
            
            guard let device = AVCaptureDevice.default(for: .video),
                  let input = try? AVCaptureDeviceInput(device: device) else { return }
            
            if session.canAddInput(input) { session.addInput(input) }
            
            self.videoOutput.setSampleBufferDelegate(self, queue: self.sessionQueue)
            self.videoOutput.alwaysDiscardsLateVideoFrames = true
            if session.canAddOutput(self.videoOutput) { session.addOutput(self.videoOutput) }
            
            session.startRunning()
            self.captureSession = session
            DispatchQueue.main.async { self.isRunning = true }
        }
    }
    
    func stopSession() {
        sessionQueue.async { [weak self] in
            self?.captureSession?.stopRunning()
            DispatchQueue.main.async { self?.isRunning = false }
        }
    }
    
    func saveMeasurement(lightSource: String, plantName: String?) {
        let m = Measurement(ppfd: ppfd, lux: lux, cct: cct, dli: dli,
                           lightSource: lightSource, plantName: plantName)
        measurements.insert(m, at: 0)
        if let data = try? JSONEncoder().encode(measurements) {
            UserDefaults.standard.set(data, forKey: "measurements")
        }
    }
    
    func exportCSV() -> URL? {
        guard !measurements.isEmpty else { return nil }
        var csv = "Tarih,Saat,PPFD,LUX,CCT,DLI,Isik Kaynagi,Bitki\n"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        for m in measurements {
            let date = dateFormatter.string(from: m.date)
            let time = timeFormatter.string(from: m.date)
            let plant = m.plantName ?? ""
            csv += "\(date),\(time),\(String(format: "%.1f", m.ppfd)),\(Int(m.lux)),\(Int(m.cct)),\(String(format: "%.2f", m.dli)),\(m.lightSource),\(plant)\n"
        }
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("GrowPAR_olcumler.csv")
        try? csv.write(to: url, atomically: true, encoding: .utf8)
        return url
    }
    
    func loadMeasurements() {
        if let data = UserDefaults.standard.data(forKey: "measurements"),
           let decoded = try? JSONDecoder().decode([Measurement].self, from: data) {
            measurements = decoded
        }
    }
    
    func calculateMetrics(r: Double, g: Double, b: Double,
                          iso: Float, exposureDuration: Double) {
        let aperture: Double = 1.78
        let safeExp = max(exposureDuration, 0.000001)
        let safeISO = max(Double(iso), 1.0)
        let ev = log2((100.0 * aperture * aperture) / (safeISO * safeExp))
        let rawLux = 2.5 * pow(2.0, min(ev, 20))
        let rawPPFD = rawLux * luxToPPFDFactor * calibrationFactor
        
        let ratio = r / (b + 0.001)
        var rawCCT: Double
        if ratio > 3.0 { rawCCT = 1800 + (4.0 - ratio) * 400 }
        else if ratio > 1.5 { rawCCT = 2700 + (3.0 - ratio) * 1500 }
        else if ratio > 0.8 { rawCCT = 5000 + (1.5 - ratio) * 4000 }
        else { rawCCT = 8000 + (0.8 - ratio) * 5000 }
        rawCCT = max(1000, min(10000, rawCCT))
        
        let rawDLI = rawPPFD * photoperiod * 3600.0 / 1_000_000.0
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.lux = max(0, rawLux)
            self.ppfd = max(0, rawPPFD)
            self.cct = rawCCT
            self.dli = max(0, rawDLI)
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        var iso: Float = 100.0
        var expTime: Double = 1.0/60.0
        if let device = AVCaptureDevice.default(for: .video) {
            iso = device.iso
            expTime = device.exposureDuration.seconds
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
        defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }
        
        let width = CVPixelBufferGetWidth(pixelBuffer)
        let height = CVPixelBufferGetHeight(pixelBuffer)
        guard let baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer) else { return }
        let bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer)
        
        let sampleW = min(100, width / 4)
        let sampleH = min(100, height / 4)
        let startX = width / 2 - sampleW / 2
        let startY = height / 2 - sampleH / 2
        
        var totalR: Double = 0, totalG: Double = 0, totalB: Double = 0, count: Double = 0
        let buffer = baseAddress.assumingMemoryBound(to: UInt8.self)
        
        for y in stride(from: startY, to: startY + sampleH, by: 2) {
            for x in stride(from: startX, to: startX + sampleW, by: 2) {
                let offset = y * bytesPerRow + x * 4
                totalB += Double(buffer[offset])
                totalG += Double(buffer[offset + 1])
                totalR += Double(buffer[offset + 2])
                count += 1
            }
        }
        
        guard count > 0 else { return }
        calculateMetrics(r: totalR/count/255, g: totalG/count/255, b: totalB/count/255,
                        iso: iso, exposureDuration: expTime)
    }
}
