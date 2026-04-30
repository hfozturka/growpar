import SwiftUI

enum LightSource: String, CaseIterable {
    case fullSpectrum = "Full Spectrum LED"
    case redBlue = "Red/Blue LED"
    case hps = "HPS"
    case cmh = "CMH"
    case sunlight = "Sunlight"

    var icon: String {
        switch self {
        case .fullSpectrum: return "💡"
        case .redBlue: return "🔴"
        case .hps: return "🟡"
        case .cmh: return "⚪"
        case .sunlight: return "☀️"
        }
    }

    var luxToPPFD: Double {
        switch self {
        case .fullSpectrum: return 0.0185
        case .redBlue: return 0.0312
        case .hps: return 0.0140
        case .cmh: return 0.0170
        case .sunlight: return 0.0200
        }
    }
}

struct Plant: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let minPPFD: Double
    let maxPPFD: Double
    let minDLI: Double
    let maxDLI: Double
    let seedlingPPFD: Double
    let vegetativePPFD: Double
    let floweringPPFD: Double
    let fruitingPPFD: Double
    let minTemp: Double
    let maxTemp: Double
    let nightTemp: Double
    let minHumidity: Double
    let maxHumidity: Double
    let co2: Int
    let phMin: Double
    let phMax: Double
    let ecMin: Double
    let ecMax: Double
    let lightDistance: String
    let photoperiod: String
    let lightType: String
}

let plants: [Plant] = [
    Plant(name: "Marul", icon: "🥬", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12,
          seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.2,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Ispanak", icon: "🌿", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12,
          seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 10, maxTemp: 20, nightTemp: 8, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Roka", icon: "🌱", minPPFD: 150, maxPPFD: 250, minDLI: 6, maxDLI: 10,
          seedlingPPFD: 80, vegetativePPFD: 180, floweringPPFD: 200, fruitingPPFD: 200,
          minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 45, maxHumidity: 65,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.4,
          lightDistance: "35-50 cm", photoperiod: "12-14 saat", lightType: "Full Spectrum"),
    Plant(name: "Pazı", icon: "🥬", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12,
          seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 10, maxTemp: 24, nightTemp: 8, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 1.8,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Kale", icon: "🥦", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 16,
          seedlingPPFD: 120, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70,
          co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Domates", icon: "🍅", minPPFD: 400, maxPPFD: 700, minDLI: 20, maxDLI: 30,
          seedlingPPFD: 200, vegetativePPFD: 500, floweringPPFD: 600, fruitingPPFD: 650,
          minTemp: 18, maxTemp: 28, nightTemp: 16, minHumidity: 60, maxHumidity: 80,
          co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 2.0, ecMax: 4.0,
          lightDistance: "20-35 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Biber", icon: "🌶", minPPFD: 350, maxPPFD: 650, minDLI: 18, maxDLI: 28,
          seedlingPPFD: 180, vegetativePPFD: 450, floweringPPFD: 550, fruitingPPFD: 600,
          minTemp: 18, maxTemp: 28, nightTemp: 16, minHumidity: 60, maxHumidity: 80,
          co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 1.8, ecMax: 3.5,
          lightDistance: "20-35 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Salatalık", icon: "🥒", minPPFD: 400, maxPPFD: 700, minDLI: 20, maxDLI: 30,
          seedlingPPFD: 200, vegetativePPFD: 500, floweringPPFD: 600, fruitingPPFD: 650,
          minTemp: 20, maxTemp: 30, nightTemp: 18, minHumidity: 70, maxHumidity: 85,
          co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 1.8, ecMax: 3.5,
          lightDistance: "20-30 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Patlıcan", icon: "🍆", minPPFD: 400, maxPPFD: 700, minDLI: 18, maxDLI: 28,
          seedlingPPFD: 180, vegetativePPFD: 480, floweringPPFD: 580, fruitingPPFD: 620,
          minTemp: 20, maxTemp: 30, nightTemp: 18, minHumidity: 60, maxHumidity: 80,
          co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 2.0, ecMax: 3.5,
          lightDistance: "20-35 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Kabak", icon: "🥗", minPPFD: 400, maxPPFD: 600, minDLI: 16, maxDLI: 24,
          seedlingPPFD: 180, vegetativePPFD: 450, floweringPPFD: 520, fruitingPPFD: 550,
          minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80,
          co2: 1000, phMin: 6.0, phMax: 7.0, ecMin: 1.5, ecMax: 3.0,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Fasulye", icon: "🫘", minPPFD: 300, maxPPFD: 500, minDLI: 14, maxDLI: 22,
          seedlingPPFD: 150, vegetativePPFD: 350, floweringPPFD: 450, fruitingPPFD: 480,
          minTemp: 18, maxTemp: 26, nightTemp: 15, minHumidity: 55, maxHumidity: 75,
          co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.5,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Bezelye", icon: "🫛", minPPFD: 250, maxPPFD: 450, minDLI: 12, maxDLI: 20,
          seedlingPPFD: 120, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 420,
          minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70,
          co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.8,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Çilek", icon: "🍓", minPPFD: 300, maxPPFD: 600, minDLI: 15, maxDLI: 25,
          seedlingPPFD: 150, vegetativePPFD: 400, floweringPPFD: 500, fruitingPPFD: 550,
          minTemp: 15, maxTemp: 25, nightTemp: 12, minHumidity: 60, maxHumidity: 80,
          co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 2.5,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Ahududu", icon: "🫐", minPPFD: 300, maxPPFD: 500, minDLI: 14, maxDLI: 22,
          seedlingPPFD: 150, vegetativePPFD: 350, floweringPPFD: 450, fruitingPPFD: 480,
          minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 60, maxHumidity: 80,
          co2: 900, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 2.0,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Kavun", icon: "🍈", minPPFD: 500, maxPPFD: 800, minDLI: 25, maxDLI: 35,
          seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750,
          minTemp: 22, maxTemp: 32, nightTemp: 18, minHumidity: 60, maxHumidity: 80,
          co2: 1200, phMin: 6.0, phMax: 6.8, ecMin: 1.5, ecMax: 3.0,
          lightDistance: "15-30 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Karpuz", icon: "🍉", minPPFD: 500, maxPPFD: 800, minDLI: 25, maxDLI: 35,
          seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750,
          minTemp: 22, maxTemp: 32, nightTemp: 18, minHumidity: 60, maxHumidity: 80,
          co2: 1200, phMin: 6.0, phMax: 6.8, ecMin: 1.5, ecMax: 3.0,
          lightDistance: "15-30 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Fesleğen", icon: "🌿", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 16,
          seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 18, maxTemp: 26, nightTemp: 15, minHumidity: 50, maxHumidity: 70,
          co2: 900, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Nane", icon: "🌿", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 24, nightTemp: 12, minHumidity: 55, maxHumidity: 75,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Maydanoz", icon: "🌿", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Kişniş", icon: "🌿", minPPFD: 150, maxPPFD: 250, minDLI: 6, maxDLI: 12,
          seedlingPPFD: 80, vegetativePPFD: 180, floweringPPFD: 220, fruitingPPFD: 230,
          minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 45, maxHumidity: 65,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.4,
          lightDistance: "35-50 cm", photoperiod: "12-14 saat", lightType: "Full Spectrum"),
    Plant(name: "Dereotu", icon: "🌿", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Kekik", icon: "🌿", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18,
          seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Biberiye", icon: "🌿", minPPFD: 200, maxPPFD: 450, minDLI: 12, maxDLI: 20,
          seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 380, fruitingPPFD: 400,
          minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Lavanta", icon: "🌸", minPPFD: 200, maxPPFD: 400, minDLI: 12, maxDLI: 20,
          seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 15, maxTemp: 26, nightTemp: 10, minHumidity: 40, maxHumidity: 60,
          co2: 800, phMin: 6.5, phMax: 7.5, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Adaçayı", icon: "🌿", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18,
          seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Gül", icon: "🌹", minPPFD: 300, maxPPFD: 600, minDLI: 16, maxDLI: 24,
          seedlingPPFD: 150, vegetativePPFD: 400, floweringPPFD: 550, fruitingPPFD: 550,
          minTemp: 18, maxTemp: 26, nightTemp: 14, minHumidity: 55, maxHumidity: 75,
          co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 1.2, ecMax: 2.5,
          lightDistance: "20-35 cm", photoperiod: "16-18 saat", lightType: "Full Spectrum"),
    Plant(name: "Orkide", icon: "🌸", minPPFD: 100, maxPPFD: 250, minDLI: 6, maxDLI: 12,
          seedlingPPFD: 50, vegetativePPFD: 150, floweringPPFD: 200, fruitingPPFD: 200,
          minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80,
          co2: 800, phMin: 5.5, phMax: 6.5, ecMin: 0.5, ecMax: 1.5,
          lightDistance: "40-60 cm", photoperiod: "12-14 saat", lightType: "Full Spectrum"),
    Plant(name: "Papatya", icon: "🌼", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18,
          seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350,
          minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70,
          co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0,
          lightDistance: "25-40 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Lale", icon: "🌷", minPPFD: 200, maxPPFD: 350, minDLI: 10, maxDLI: 16,
          seedlingPPFD: 100, vegetativePPFD: 250, floweringPPFD: 320, fruitingPPFD: 320,
          minTemp: 10, maxTemp: 20, nightTemp: 8, minHumidity: 50, maxHumidity: 70,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0,
          lightDistance: "30-45 cm", photoperiod: "12-14 saat", lightType: "Full Spectrum"),
    Plant(name: "Ayçiçeği", icon: "🌻", minPPFD: 500, maxPPFD: 900, minDLI: 25, maxDLI: 40,
          seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 850,
          minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 45, maxHumidity: 65,
          co2: 1000, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.5,
          lightDistance: "15-25 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Mikrogreens", icon: "🌱", minPPFD: 100, maxPPFD: 250, minDLI: 6, maxDLI: 12,
          seedlingPPFD: 80, vegetativePPFD: 150, floweringPPFD: 200, fruitingPPFD: 200,
          minTemp: 18, maxTemp: 24, nightTemp: 15, minHumidity: 60, maxHumidity: 80,
          co2: 800, phMin: 5.8, phMax: 6.5, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "20-30 cm", photoperiod: "12-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Wheatgrass", icon: "🌾", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 60, maxHumidity: 80,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6,
          lightDistance: "25-40 cm", photoperiod: "12-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Bambu", icon: "🎋", minPPFD: 200, maxPPFD: 500, minDLI: 12, maxDLI: 22,
          seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 450,
          minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80,
          co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0,
          lightDistance: "20-35 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Su Teresi", icon: "💧", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 70, maxHumidity: 90,
          co2: 800, phMin: 6.5, phMax: 7.5, ecMin: 0.4, ecMax: 1.6,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Pak Choy", icon: "🥬", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14,
          seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250,
          minTemp: 15, maxTemp: 22, nightTemp: 10, minHumidity: 55, maxHumidity: 75,
          co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0,
          lightDistance: "30-45 cm", photoperiod: "14-16 saat", lightType: "Full Spectrum"),
    Plant(name: "Cannabis", icon: "🌱", minPPFD: 600, maxPPFD: 900, minDLI: 30, maxDLI: 45,
          seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 900,
          minTemp: 20, maxTemp: 28, nightTemp: 18, minHumidity: 40, maxHumidity: 70,
          co2: 1500, phMin: 5.8, phMax: 6.5, ecMin: 0.8, ecMax: 3.0,
          lightDistance: "15-30 cm", photoperiod: "18/12 saat", lightType: "Full Spectrum"),
]

struct ContentView: View {
    @StateObject private var camera = CameraManager()
    @State private var photoperiod: Double = 16
    @State private var showCalibration = false
    @State private var showHistory = false
    @State private var showSettings = false
    @State private var selectedLight: LightSource = .fullSpectrum
    @State private var selectedPlant: Plant? = nil
    @State private var showLightPicker = false
    @State private var showPlantPicker = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("GrowPAR")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("Grow Light Meter")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: { showHistory = true }) {
                            Image(systemName: "clock.arrow.circlepath")
                                .foregroundColor(.gray)
                                .font(.system(size: 18))
                        }
                        Button(action: { showSettings = true }) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.gray)
                                .font(.system(size: 18))
                        }
                        Circle()
                            .fill(camera.isRunning ? Color.green : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    Button(action: { showLightPicker = true }) {
                        HStack {
                            Text(selectedLight.icon)
                            Text(selectedLight.rawValue)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(white: 0.12))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    Button(action: { showPlantPicker = true }) {
                        HStack {
                            Text(selectedPlant?.icon ?? "🌱")
                            Text(selectedPlant?.name ?? "Select Plant")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(selectedPlant == nil ? .gray : .white)
                            Spacer()
                            if let plant = selectedPlant {
                                Text("\(Int(plant.minPPFD))–\(Int(plant.maxPPFD)) μmol")
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                            }
                            Image(systemName: "chevron.down")
                                .font(.system(size: 11))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(white: 0.12))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    if let plant = selectedPlant, camera.isRunning {
                        SufficiencyView(ppfd: camera.ppfd, plant: plant)
                            .padding(.horizontal)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(white: 0.08))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green.opacity(0.3), lineWidth: 1))
                        VStack(spacing: 6) {
                            Text("PPFD")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.gray)
                                .tracking(3)
                            Text(camera.isRunning ? String(format: "%.0f", camera.ppfd) : "—")
                                .font(.system(size: 72, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .monospacedDigit()
                            Text("μmol/m²/s")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                            if camera.isRunning {
                                PPFDLevelBar(ppfd: camera.ppfd, plant: selectedPlant)
                                    .padding(.top, 4)
                            }
                        }
                        .padding(28)
                    }
                    .padding(.horizontal)

                    HStack(spacing: 12) {
                        MetricCard(title: "LUX", value: camera.isRunning ? String(format: "%.0f", camera.lux) : "—", unit: "lx", color: .yellow)
                        MetricCard(title: "CCT", value: camera.isRunning ? String(format: "%.0f", camera.cct) : "—", unit: "K", color: .cyan)
                    }
                    .padding(.horizontal)

                    ZStack {
                        RoundedRectangle(cornerRadius: 16).fill(Color(white: 0.08))
                        VStack(spacing: 12) {
                            HStack {
                                Text("DLI").font(.system(size: 11, weight: .medium)).foregroundColor(.gray).tracking(3)
                                Spacer()
                                Text("mol/m²/day").font(.system(size: 11)).foregroundColor(.gray)
                            }
                            HStack(alignment: .bottom) {
                                Text(camera.isRunning ? String(format: "%.1f", camera.dli) : "—")
                                    .font(.system(size: 40, weight: .bold, design: .rounded))
                                    .foregroundColor(.white).monospacedDigit()
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text(dliCategory(camera.dli))
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(dliColor(camera.dli))
                                    if let plant = selectedPlant {
                                        Text("Target: \(Int(plant.minDLI))–\(Int(plant.maxDLI))")
                                            .font(.system(size: 11)).foregroundColor(.gray)
                                    }
                                }
                            }
                            VStack(spacing: 6) {
                                HStack {
                                    Text("Photoperiod").font(.system(size: 11)).foregroundColor(.gray)
                                    Spacer()
                                    Text("\(Int(photoperiod)) h/day").font(.system(size: 11, weight: .medium)).foregroundColor(.white)
                                }
                                Slider(value: $photoperiod, in: 8...24, step: 1)
                                    .tint(.green)
                                    .onChange(of: photoperiod) { _, val in camera.photoperiod = val }
                            }
                        }
                        .padding(16)
                    }
                    .padding(.horizontal)

                    ZStack {
                        RoundedRectangle(cornerRadius: 16).fill(Color(white: 0.08))
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("CALIBRATION").font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(3)
                                Text(String(format: "%.3f", camera.calibrationFactor)).font(.system(size: 20, weight: .bold)).foregroundColor(.white)
                                Text("Apogee MQ-500").font(.system(size: 10)).foregroundColor(.gray)
                            }
                            Spacer()
                            Button("Calibrate") { showCalibration = true }
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.black)
                                .padding(.horizontal, 16).padding(.vertical, 8)
                                .background(Color.green).cornerRadius(8)
                        }
                        .padding(16)
                    }
                    .padding(.horizontal)

                    Button(action: {
                        if camera.isRunning { camera.stopSession() }
                        else { camera.requestPermissionAndStart() }
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: camera.isRunning ? "stop.fill" : "play.fill")
                            Text(camera.isRunning ? "Stop Measurement" : "Start Measurement")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(camera.isRunning ? Color.red : Color.green)
                        .cornerRadius(14)
                    }
                    .padding(.horizontal)

                    if camera.isRunning {
                        Button(action: {
                            camera.saveMeasurement(lightSource: selectedLight.rawValue, plantName: selectedPlant?.name)
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "square.and.arrow.down")
                                Text("Save Measurement").font(.system(size: 15, weight: .semibold))
                            }
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.green.opacity(0.15))
                            .cornerRadius(14)
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.green.opacity(0.4), lineWidth: 1))
                        }
                        .padding(.horizontal)
                    }

                    Spacer().frame(height: 32)
                }
                .padding(.top, 12)
            }
        }
        .sheet(isPresented: $showCalibration) { CalibrationView(camera: camera) }
        .sheet(isPresented: $showHistory) { HistoryView(camera: camera) }
        .sheet(isPresented: $showLightPicker) { LightPickerView(selected: $selectedLight, camera: camera) }
        .sheet(isPresented: $showPlantPicker) { PlantPickerView(selected: $selectedPlant) }
        .sheet(isPresented: $showSettings) { SettingsView(camera: camera) }
        .onChange(of: selectedLight) { _, light in camera.luxToPPFDFactor = light.luxToPPFD }
    }

    func dliCategory(_ dli: Double) -> String {
        switch dli {
        case 0..<6: return "Very Low"
        case 6..<12: return "Low"
        case 12..<20: return "Medium"
        case 20..<30: return "Good"
        case 30..<45: return "High"
        default: return "Very High"
        }
    }

    func dliColor(_ dli: Double) -> Color {
        switch dli {
        case 0..<6: return .red
        case 6..<12: return .orange
        case 12..<20: return .yellow
        case 20..<30: return .green
        case 30..<45: return .cyan
        default: return .purple
        }
    }
}

struct SufficiencyView: View {
    let ppfd: Double
    let plant: Plant

    var status: (text: String, color: Color, icon: String) {
        if ppfd < plant.minPPFD * 0.5 { return ("Light Too Low", .red, "exclamationmark.triangle.fill") }
        else if ppfd < plant.minPPFD { return ("Light Insufficient", .orange, "exclamationmark.circle.fill") }
        else if ppfd <= plant.maxPPFD { return ("Light Sufficient ✓", .green, "checkmark.circle.fill") }
        else { return ("Light Excess", .yellow, "exclamationmark.circle.fill") }
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: status.icon).foregroundColor(status.color).font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(status.text).font(.system(size: 14, weight: .semibold)).foregroundColor(status.color)
                Text("\(plant.icon) \(plant.name): \(Int(plant.minPPFD))–\(Int(plant.maxPPFD)) μmol/m²/s")
                    .font(.system(size: 11)).foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(14)
        .background(status.color.opacity(0.1))
        .cornerRadius(10)
    }
}

struct MetricCard: View {
    let title: String
    let value: String
    let unit: String
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16).fill(Color(white: 0.08))
            VStack(spacing: 4) {
                Text(title).font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
                Text(value).font(.system(size: 32, weight: .bold, design: .rounded)).foregroundColor(.white).monospacedDigit()
                Text(unit).font(.system(size: 11)).foregroundColor(color)
            }
            .padding(.vertical, 16)
        }
        .frame(maxWidth: .infinity)
    }
}

struct PPFDLevelBar: View {
    let ppfd: Double
    let plant: Plant?

    var body: some View {
        VStack(spacing: 4) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color(white: 0.15)).frame(height: 6)
                    if let plant = plant {
                        let minX = geo.size.width * min(plant.minPPFD / 1000, 1.0)
                        let maxX = geo.size.width * min(plant.maxPPFD / 1000, 1.0)
                        Rectangle().fill(Color.green.opacity(0.3)).frame(width: maxX - minX, height: 6).offset(x: minX)
                    }
                    RoundedRectangle(cornerRadius: 4).fill(barColor)
                        .frame(width: geo.size.width * min(ppfd / 1000, 1.0), height: 6)
                        .animation(.easeOut(duration: 0.3), value: ppfd)
                }
            }
            .frame(height: 6)
            HStack {
                Text("0"); Spacer(); Text("250"); Spacer(); Text("500"); Spacer(); Text("750"); Spacer(); Text("1000+")
            }
            .font(.system(size: 9)).foregroundColor(.gray)
        }
    }

    var barColor: Color {
        switch ppfd {
        case 0..<100: return .red
        case 100..<300: return .orange
        case 300..<600: return .green
        case 600..<900: return .cyan
        default: return .purple
        }
    }
}

struct LightPickerView: View {
    @Binding var selected: LightSource
    @ObservedObject var camera: CameraManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Light Source").font(.system(size: 18, weight: .bold)).foregroundColor(.white).padding(20)
                ForEach(LightSource.allCases, id: \.self) { light in
                    Button(action: { selected = light; camera.luxToPPFDFactor = light.luxToPPFD; dismiss() }) {
                        HStack(spacing: 14) {
                            Text(light.icon).font(.system(size: 24))
                            VStack(alignment: .leading, spacing: 2) {
                                Text(light.rawValue).font(.system(size: 15, weight: .medium)).foregroundColor(.white)
                                Text("Factor: \(String(format: "%.4f", light.luxToPPFD))").font(.system(size: 11)).foregroundColor(.gray)
                            }
                            Spacer()
                            if selected == light { Image(systemName: "checkmark.circle.fill").foregroundColor(.green) }
                        }
                        .padding(.horizontal, 20).padding(.vertical, 14)
                        .background(selected == light ? Color(white: 0.12) : Color.clear)
                    }
                    Divider().background(Color(white: 0.15))
                }
                Spacer()
            }
        }
    }
}

struct PlantPickerView: View {
    @Binding var selected: Plant?
    @Environment(\.dismiss) var dismiss
    @State private var detailPlant: Plant? = nil

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Select Plant").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Button("Close") { dismiss() }.foregroundColor(.gray)
                }
                .padding(20)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(plants) { plant in
                            HStack(spacing: 14) {
                                Button(action: { selected = plant; dismiss() }) {
                                    HStack(spacing: 14) {
                                        Text(plant.icon).font(.system(size: 24)).frame(width: 36)
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(plant.name).font(.system(size: 15, weight: .medium)).foregroundColor(.white)
                                            Text("PPFD: \(Int(plant.minPPFD))–\(Int(plant.maxPPFD)) · DLI: \(Int(plant.minDLI))–\(Int(plant.maxDLI))")
                                                .font(.system(size: 11)).foregroundColor(.gray)
                                        }
                                        Spacer()
                                        if selected?.name == plant.name {
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                        }
                                    }
                                }
                                Button(action: { detailPlant = plant }) {
                                    Image(systemName: "info.circle").foregroundColor(.gray).font(.system(size: 18))
                                }
                            }
                            .padding(.horizontal, 20).padding(.vertical, 12)
                            .background(selected?.name == plant.name ? Color(white: 0.12) : Color.clear)
                            Divider().background(Color(white: 0.15))
                        }
                    }
                }
            }
        }
        .sheet(item: $detailPlant) { plant in PlantDetailView(plant: plant) }
    }
}

struct PlantDetailView: View {
    let plant: Plant
    @Environment(\.dismiss) var dismiss
    @State private var selectedStage = 0
    let stages = ["Seedling", "Vegetative", "Flowering", "Harvest"]

    var stagePPFD: Double {
        switch selectedStage {
        case 0: return plant.seedlingPPFD
        case 1: return plant.vegetativePPFD
        case 2: return plant.floweringPPFD
        case 3: return plant.fruitingPPFD
        default: return plant.minPPFD
        }
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        Text(plant.icon).font(.system(size: 48))
                        VStack(alignment: .leading) {
                            Text(plant.name).font(.system(size: 28, weight: .bold)).foregroundColor(.white)
                            Text(plant.lightType).font(.system(size: 12)).foregroundColor(.green)
                        }
                        Spacer()
                        Button("Close") { dismiss() }.foregroundColor(.gray)
                    }
                    .padding()

                    VStack(spacing: 10) {
                        Text("GROWTH STAGE").font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
                        Picker("Stage", selection: $selectedStage) {
                            ForEach(0..<stages.count, id: \.self) { i in Text(stages[i]).tag(i) }
                        }
                        .pickerStyle(.segmented).padding(.horizontal)

                        HStack {
                            VStack {
                                Text("Target PPFD").font(.system(size: 11)).foregroundColor(.gray)
                                Text("\(Int(stagePPFD))").font(.system(size: 36, weight: .bold)).foregroundColor(.green)
                                Text("μmol/m²/s").font(.system(size: 11)).foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                Text("DLI Range").font(.system(size: 11)).foregroundColor(.gray)
                                Text("\(Int(plant.minDLI))–\(Int(plant.maxDLI))").font(.system(size: 36, weight: .bold)).foregroundColor(.cyan)
                                Text("mol/m²/day").font(.system(size: 11)).foregroundColor(.gray)
                            }
                        }
                        .padding().background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
                    }

                    DetailSection(title: "LIGHT OPTIMIZATION", icon: "💡") {
                        DetailRow(label: "LED Distance", value: plant.lightDistance)
                        DetailRow(label: "Photoperiod", value: plant.photoperiod)
                        DetailRow(label: "Light Type", value: plant.lightType)
                    }
                    DetailSection(title: "TEMPERATURE & HUMIDITY", icon: "🌡️") {
                        DetailRow(label: "Day Temperature", value: "\(Int(plant.minTemp))–\(Int(plant.maxTemp))°C")
                        DetailRow(label: "Night Temperature", value: "\(Int(plant.nightTemp))°C")
                        DetailRow(label: "Humidity", value: "\(Int(plant.minHumidity))–\(Int(plant.maxHumidity))%")
                        DetailRow(label: "CO₂", value: "\(plant.co2) ppm")
                    }
                    DetailSection(title: "HYDROPONICS", icon: "💧") {
                        DetailRow(label: "pH Range", value: "\(plant.phMin)–\(plant.phMax)")
                        DetailRow(label: "EC Value", value: "\(plant.ecMin)–\(plant.ecMax) mS/cm")
                    }
                }
                .padding(.bottom, 32)
            }
        }
    }
}

struct DetailSection<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(icon)
                Text(title).font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
            }
            .padding(.horizontal).padding(.bottom, 8)
            VStack(spacing: 0) { content }
                .background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(label).font(.system(size: 14)).foregroundColor(.gray)
                Spacer()
                Text(value).font(.system(size: 14, weight: .medium)).foregroundColor(.white)
            }
            .padding(.horizontal, 16).padding(.vertical, 12)
            Divider().background(Color(white: 0.12))
        }
    }
}

struct HistoryView: View {
    @ObservedObject var camera: CameraManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Measurement History").font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        if let url = camera.exportCSV() {
                            let av = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let window = windowScene.windows.first,
                               let rootVC = window.rootViewController {
                                var topVC = rootVC
                                while let presented = topVC.presentedViewController { topVC = presented }
                                topVC.present(av, animated: true)
                            }
                        }
                    }) {
                        Image(systemName: "square.and.arrow.up").foregroundColor(.green).font(.system(size: 15))
                    }
                    .padding(.trailing, 12)
                    Button("Delete All") {
                        camera.measurements.removeAll()
                        UserDefaults.standard.removeObject(forKey: "measurements")
                    }
                    .foregroundColor(.red).font(.system(size: 13)).padding(.trailing, 12)
                    Button("Close") { dismiss() }.foregroundColor(.gray)
                }
                .padding(20)

                if camera.measurements.isEmpty {
                    Spacer()
                    Text("No measurements saved yet").foregroundColor(.gray).font(.system(size: 14))
                    Spacer()
                } else {
                    List {
                        ForEach(camera.measurements) { m in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(String(format: "%.0f μmol/m²/s", m.ppfd))
                                        .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                                    Spacer()
                                    Text(m.date, style: .time).font(.system(size: 11)).foregroundColor(.gray)
                                }
                                HStack(spacing: 12) {
                                    Text("LUX: \(Int(m.lux))")
                                    Text("CCT: \(Int(m.cct))K")
                                    Text("DLI: \(String(format: "%.1f", m.dli))")
                                }
                                .font(.system(size: 11)).foregroundColor(.gray)
                                HStack(spacing: 8) {
                                    Text(m.lightSource)
                                    if let plant = m.plantName { Text("· \(plant)") }
                                    Spacer()
                                    Text(m.date, style: .date)
                                }
                                .font(.system(size: 10)).foregroundColor(Color(white: 0.4))
                            }
                            .listRowBackground(Color(white: 0.08)).padding(.vertical, 4)
                        }
                        .onDelete { indexSet in
                            camera.measurements.remove(atOffsets: indexSet)
                            if let data = try? JSONEncoder().encode(camera.measurements) {
                                UserDefaults.standard.set(data, forKey: "measurements")
                            }
                        }
                    }
                    .listStyle(.plain).scrollContentBackground(.hidden)
                }
            }
        }
    }
}

struct SettingsView: View {
    @ObservedObject var camera: CameraManager
    @Environment(\.dismiss) var dismiss
    @AppStorage("diffuserReminder") var diffuserReminder = true

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Settings").font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                        Spacer()
                        Button("Close") { dismiss() }.foregroundColor(.gray)
                    }
                    .padding()

                    SettingsSection(title: "DIFFUSER", icon: "📋") {
                        SettingsRow {
                            Text("Diffuser Reminder").foregroundColor(.white).font(.system(size: 15))
                            Spacer()
                            Toggle("", isOn: $diffuserReminder).tint(.green)
                        }
                        if diffuserReminder {
                            SettingsRow {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("💡 Reminder Active").font(.system(size: 13, weight: .medium)).foregroundColor(.green)
                                    Text("Make sure diffuser is attached before measuring")
                                        .font(.system(size: 11)).foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                    }

                    SettingsSection(title: "CALIBRATION", icon: "🎯") {
                        SettingsRow {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Calibration Factor").foregroundColor(.white).font(.system(size: 15))
                                Text(String(format: "%.4f", camera.calibrationFactor)).foregroundColor(.green).font(.system(size: 13))
                            }
                            Spacer()
                        }
                        SettingsRow {
                            Button(action: {
                                camera.calibrationFactor = 1.112
                                UserDefaults.standard.removeObject(forKey: "calibrationFactor")
                            }) {
                                HStack {
                                    Image(systemName: "arrow.counterclockwise")
                                    Text("Reset Calibration")
                                }
                                .foregroundColor(.red).font(.system(size: 15))
                            }
                            Spacer()
                        }
                    }

                    SettingsSection(title: "ABOUT", icon: "ℹ️") {
                        SettingsRow {
                            Text("App").foregroundColor(.gray).font(.system(size: 14))
                            Spacer()
                            Text("GrowPAR v1.0").foregroundColor(.white).font(.system(size: 14))
                        }
                        SettingsRow {
                            Text("Sensor").foregroundColor(.gray).font(.system(size: 14))
                            Spacer()
                            Text("Camera + Apogee MQ-500").foregroundColor(.white).font(.system(size: 14))
                        }
                        SettingsRow {
                            Text("Developer").foregroundColor(.gray).font(.system(size: 14))
                            Spacer()
                            Text("hfozturka").foregroundColor(.white).font(.system(size: 14))
                        }
                    }

                    Spacer().frame(height: 32)
                }
            }
        }
    }
}

struct SettingsSection<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(icon)
                Text(title).font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
            }
            .padding(.horizontal).padding(.bottom, 8)
            VStack(spacing: 0) { content }
                .background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
        }
    }
}

struct SettingsRow<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(spacing: 0) {
            HStack { content }
                .padding(.horizontal, 16).padding(.vertical, 12)
            Divider().background(Color(white: 0.12))
        }
    }
}

struct CalibrationView: View {
    @ObservedObject var camera: CameraManager
    @Environment(\.dismiss) var dismiss
    @State private var referenceValue: String = ""

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Calibration").font(.system(size: 24, weight: .bold)).foregroundColor(.white).padding(.top, 32)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Apogee MQ-500 value").font(.system(size: 13)).foregroundColor(.gray)
                    TextField("e.g. 450", text: $referenceValue)
                        .keyboardType(.decimalPad).font(.system(size: 20)).foregroundColor(.white)
                        .padding().background(Color(white: 0.12)).cornerRadius(10)
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Current app reading").font(.system(size: 13)).foregroundColor(.gray)
                    Text(String(format: "%.1f μmol/m²/s", camera.ppfd))
                        .font(.system(size: 20, weight: .semibold)).foregroundColor(.green)
                        .padding().frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(white: 0.12)).cornerRadius(10)
                }
                .padding(.horizontal)
                Button("Apply Calibration") {
                    if let ref = Double(referenceValue), camera.ppfd > 0 {
                        camera.calibrationFactor = ref / (camera.ppfd / camera.calibrationFactor)
                        UserDefaults.standard.set(camera.calibrationFactor, forKey: "calibrationFactor")
                    }
                    dismiss()
                }
                .font(.system(size: 16, weight: .semibold)).foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 16)
                .background(Color.green).cornerRadius(14).padding(.horizontal)
                Button("Cancel") { dismiss() }.foregroundColor(.gray)
                Spacer()
            }
        }
    }
}
