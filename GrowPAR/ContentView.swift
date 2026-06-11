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
    let category: String
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
    Plant(name: NSLocalizedString("Lettuce", comment: ""), icon: "🥬", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12, seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.2, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Spinach", comment: ""), icon: "🌿", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12, seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 10, maxTemp: 20, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Roka", comment: ""), icon: "🌱", category: "Vegetable", minPPFD: 150, maxPPFD: 250, minDLI: 6, maxDLI: 10, seedlingPPFD: 80, vegetativePPFD: 180, floweringPPFD: 200, fruitingPPFD: 200, minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 45, maxHumidity: 65, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.4, lightDistance: "35-50 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Pazi", comment: ""), icon: "🥬", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12, seedlingPPFD: 100, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 10, maxTemp: 24, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 1.8, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kale", comment: ""), icon: "🥦", category: "Vegetable", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 16, seedlingPPFD: 120, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Domates", comment: ""), icon: "🍅", category: "Vegetable", minPPFD: 400, maxPPFD: 700, minDLI: 20, maxDLI: 30, seedlingPPFD: 200, vegetativePPFD: 500, floweringPPFD: 600, fruitingPPFD: 650, minTemp: 18, maxTemp: 28, nightTemp: 16, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 2.0, ecMax: 4.0, lightDistance: "20-35 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Biber", comment: ""), icon: "🌶", category: "Vegetable", minPPFD: 350, maxPPFD: 650, minDLI: 18, maxDLI: 28, seedlingPPFD: 180, vegetativePPFD: 450, floweringPPFD: 550, fruitingPPFD: 600, minTemp: 18, maxTemp: 28, nightTemp: 16, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 1.8, ecMax: 3.5, lightDistance: "20-35 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Salatalik", comment: ""), icon: "🥒", category: "Vegetable", minPPFD: 400, maxPPFD: 700, minDLI: 20, maxDLI: 30, seedlingPPFD: 200, vegetativePPFD: 500, floweringPPFD: 600, fruitingPPFD: 650, minTemp: 20, maxTemp: 30, nightTemp: 18, minHumidity: 70, maxHumidity: 85, co2: 1200, phMin: 5.8, phMax: 6.5, ecMin: 1.8, ecMax: 3.5, lightDistance: "20-30 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Patlican", comment: ""), icon: "🍆", category: "Vegetable", minPPFD: 400, maxPPFD: 700, minDLI: 18, maxDLI: 28, seedlingPPFD: 180, vegetativePPFD: 480, floweringPPFD: 580, fruitingPPFD: 620, minTemp: 20, maxTemp: 30, nightTemp: 18, minHumidity: 60, maxHumidity: 80, co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 2.0, ecMax: 3.5, lightDistance: "20-35 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kabak", comment: ""), icon: "🥗", category: "Vegetable", minPPFD: 400, maxPPFD: 600, minDLI: 16, maxDLI: 24, seedlingPPFD: 180, vegetativePPFD: 450, floweringPPFD: 520, fruitingPPFD: 550, minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80, co2: 1000, phMin: 6.0, phMax: 7.0, ecMin: 1.5, ecMax: 3.0, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Fasulye", comment: ""), icon: "🫘", category: "Vegetable", minPPFD: 300, maxPPFD: 500, minDLI: 14, maxDLI: 22, seedlingPPFD: 150, vegetativePPFD: 350, floweringPPFD: 450, fruitingPPFD: 480, minTemp: 18, maxTemp: 26, nightTemp: 15, minHumidity: 55, maxHumidity: 75, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.5, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Bezelye", comment: ""), icon: "🫛", category: "Vegetable", minPPFD: 250, maxPPFD: 450, minDLI: 12, maxDLI: 20, seedlingPPFD: 120, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 420, minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.8, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Brokoli", comment: ""), icon: "🥦", category: "Vegetable", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18, seedlingPPFD: 120, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.5, ecMax: 2.5, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Karnabahar", comment: ""), icon: "🥦", category: "Vegetable", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 16, seedlingPPFD: 120, vegetativePPFD: 270, floweringPPFD: 340, fruitingPPFD: 340, minTemp: 10, maxTemp: 20, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.5, ecMax: 2.5, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Sarimsak", comment: ""), icon: "🧄", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 10, maxTemp: 20, nightTemp: 5, minHumidity: 40, maxHumidity: 60, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Sogan", comment: ""), icon: "🧅", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 10, maxTemp: 24, nightTemp: 8, minHumidity: 45, maxHumidity: 65, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Havuc", comment: ""), icon: "🥕", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 10, maxTemp: 22, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Pak Choy", comment: ""), icon: "🥬", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 22, nightTemp: 10, minHumidity: 55, maxHumidity: 75, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Su Teresi", comment: ""), icon: "💧", category: "Vegetable", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 70, maxHumidity: 90, co2: 800, phMin: 6.5, phMax: 7.5, ecMin: 0.4, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Cilek", comment: ""), icon: "🍓", category: "Fruit", minPPFD: 300, maxPPFD: 600, minDLI: 15, maxDLI: 25, seedlingPPFD: 150, vegetativePPFD: 400, floweringPPFD: 500, fruitingPPFD: 550, minTemp: 15, maxTemp: 25, nightTemp: 12, minHumidity: 60, maxHumidity: 80, co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 2.5, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Ahududu", comment: ""), icon: "🫐", category: "Fruit", minPPFD: 300, maxPPFD: 500, minDLI: 14, maxDLI: 22, seedlingPPFD: 150, vegetativePPFD: 350, floweringPPFD: 450, fruitingPPFD: 480, minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 60, maxHumidity: 80, co2: 900, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 2.0, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kavun", comment: ""), icon: "🍈", category: "Fruit", minPPFD: 500, maxPPFD: 800, minDLI: 25, maxDLI: 35, seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750, minTemp: 22, maxTemp: 32, nightTemp: 18, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 6.0, phMax: 6.8, ecMin: 1.5, ecMax: 3.0, lightDistance: "15-30 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Karpuz", comment: ""), icon: "🍉", category: "Fruit", minPPFD: 500, maxPPFD: 800, minDLI: 25, maxDLI: 35, seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750, minTemp: 22, maxTemp: 32, nightTemp: 18, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 6.0, phMax: 6.8, ecMin: 1.5, ecMax: 3.0, lightDistance: "15-30 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Mango", comment: ""), icon: "🥭", category: "Tropical", minPPFD: 600, maxPPFD: 1000, minDLI: 30, maxDLI: 45, seedlingPPFD: 250, vegetativePPFD: 700, floweringPPFD: 900, fruitingPPFD: 950, minTemp: 24, maxTemp: 35, nightTemp: 20, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 5.5, phMax: 7.0, ecMin: 1.5, ecMax: 3.0, lightDistance: "15-25 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Avokado", comment: ""), icon: "🥑", category: "Tropical", minPPFD: 400, maxPPFD: 800, minDLI: 20, maxDLI: 35, seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750, minTemp: 20, maxTemp: 32, nightTemp: 15, minHumidity: 50, maxHumidity: 70, co2: 1000, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.5, lightDistance: "20-35 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Limon", comment: ""), icon: "🍋", category: "Tropical", minPPFD: 500, maxPPFD: 900, minDLI: 25, maxDLI: 40, seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 850, minTemp: 18, maxTemp: 30, nightTemp: 15, minHumidity: 50, maxHumidity: 70, co2: 1000, phMin: 5.5, phMax: 6.5, ecMin: 1.2, ecMax: 2.5, lightDistance: "15-30 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Portakal", comment: ""), icon: "🍊", category: "Tropical", minPPFD: 500, maxPPFD: 900, minDLI: 25, maxDLI: 40, seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 850, minTemp: 18, maxTemp: 32, nightTemp: 15, minHumidity: 50, maxHumidity: 70, co2: 1000, phMin: 5.5, phMax: 6.5, ecMin: 1.2, ecMax: 2.5, lightDistance: "15-30 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Muz", comment: ""), icon: "🍌", category: "Tropical", minPPFD: 600, maxPPFD: 1000, minDLI: 30, maxDLI: 45, seedlingPPFD: 250, vegetativePPFD: 700, floweringPPFD: 900, fruitingPPFD: 950, minTemp: 22, maxTemp: 35, nightTemp: 18, minHumidity: 65, maxHumidity: 85, co2: 1200, phMin: 5.5, phMax: 7.0, ecMin: 1.5, ecMax: 3.5, lightDistance: "15-25 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Ananas", comment: ""), icon: "🍍", category: "Tropical", minPPFD: 400, maxPPFD: 800, minDLI: 20, maxDLI: 35, seedlingPPFD: 200, vegetativePPFD: 550, floweringPPFD: 700, fruitingPPFD: 750, minTemp: 20, maxTemp: 32, nightTemp: 16, minHumidity: 55, maxHumidity: 75, co2: 1000, phMin: 4.5, phMax: 6.5, ecMin: 1.0, ecMax: 2.5, lightDistance: "20-35 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Papaya", comment: ""), icon: "🍈", category: "Tropical", minPPFD: 500, maxPPFD: 900, minDLI: 25, maxDLI: 40, seedlingPPFD: 200, vegetativePPFD: 650, floweringPPFD: 800, fruitingPPFD: 850, minTemp: 22, maxTemp: 35, nightTemp: 18, minHumidity: 60, maxHumidity: 80, co2: 1200, phMin: 5.5, phMax: 7.0, ecMin: 1.5, ecMax: 3.0, lightDistance: "15-30 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Zencefil", comment: ""), icon: "🫚", category: "Tropical", minPPFD: 150, maxPPFD: 350, minDLI: 8, maxDLI: 16, seedlingPPFD: 80, vegetativePPFD: 220, floweringPPFD: 300, fruitingPPFD: 320, minTemp: 22, maxTemp: 30, nightTemp: 18, minHumidity: 70, maxHumidity: 90, co2: 900, phMin: 5.5, phMax: 6.5, ecMin: 1.0, ecMax: 2.0, lightDistance: "35-50 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: "Fesleğen", icon: "🌿", category: "Herb", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 16, seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 18, maxTemp: 26, nightTemp: 15, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 5.8, phMax: 6.5, ecMin: 1.0, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Nane", icon: "🌿", category: "Herb", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 24, nightTemp: 12, minHumidity: 55, maxHumidity: 75, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.0, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Maydanoz", icon: "🌿", category: "Herb", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 12, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Kişniş", icon: "🌿", category: "Herb", minPPFD: 150, maxPPFD: 250, minDLI: 6, maxDLI: 12, seedlingPPFD: 80, vegetativePPFD: 180, floweringPPFD: 220, fruitingPPFD: 230, minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 45, maxHumidity: 65, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.4, lightDistance: "35-50 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: "Dereotu", icon: "🌿", category: "Herb", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Kekik", icon: "🌿", category: "Herb", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18, seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Biberiye", icon: "🌿", category: "Herb", minPPFD: 200, maxPPFD: 450, minDLI: 12, maxDLI: 20, seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 380, fruitingPPFD: 400, minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: "Adaçayı", icon: "🌿", category: "Herb", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18, seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 18, maxTemp: 28, nightTemp: 14, minHumidity: 40, maxHumidity: 60, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Ekinezya", comment: ""), icon: "🌸", category: "Medicinal", minPPFD: 200, maxPPFD: 450, minDLI: 12, maxDLI: 20, seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 420, minTemp: 15, maxTemp: 26, nightTemp: 10, minHumidity: 45, maxHumidity: 65, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.8, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Melisa", comment: ""), icon: "🌿", category: "Medicinal", minPPFD: 150, maxPPFD: 350, minDLI: 8, maxDLI: 16, seedlingPPFD: 80, vegetativePPFD: 220, floweringPPFD: 300, fruitingPPFD: 320, minTemp: 15, maxTemp: 26, nightTemp: 10, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.5, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kantaron", comment: ""), icon: "🌼", category: "Medicinal", minPPFD: 200, maxPPFD: 450, minDLI: 12, maxDLI: 20, seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 420, minTemp: 15, maxTemp: 26, nightTemp: 10, minHumidity: 45, maxHumidity: 65, co2: 900, phMin: 5.8, phMax: 7.0, ecMin: 0.8, ecMax: 1.8, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Valerian", comment: ""), icon: "🌿", category: "Medicinal", minPPFD: 150, maxPPFD: 350, minDLI: 8, maxDLI: 16, seedlingPPFD: 80, vegetativePPFD: 220, floweringPPFD: 300, fruitingPPFD: 320, minTemp: 12, maxTemp: 24, nightTemp: 8, minHumidity: 55, maxHumidity: 75, co2: 800, phMin: 5.5, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "30-45 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kusburnu", comment: ""), icon: "🌹", category: "Medicinal", minPPFD: 300, maxPPFD: 600, minDLI: 15, maxDLI: 25, seedlingPPFD: 150, vegetativePPFD: 400, floweringPPFD: 520, fruitingPPFD: 550, minTemp: 12, maxTemp: 26, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 5.5, phMax: 7.0, ecMin: 1.0, ecMax: 2.0, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Lavanta", comment: ""), icon: "🌸", category: "Flower", minPPFD: 200, maxPPFD: 400, minDLI: 12, maxDLI: 20, seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 15, maxTemp: 26, nightTemp: 10, minHumidity: 40, maxHumidity: 60, co2: 800, phMin: 6.5, phMax: 7.5, ecMin: 0.8, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Gul", comment: ""), icon: "🌹", category: "Flower", minPPFD: 300, maxPPFD: 600, minDLI: 16, maxDLI: 24, seedlingPPFD: 150, vegetativePPFD: 400, floweringPPFD: 550, fruitingPPFD: 550, minTemp: 18, maxTemp: 26, nightTemp: 14, minHumidity: 55, maxHumidity: 75, co2: 1000, phMin: 5.8, phMax: 6.5, ecMin: 1.2, ecMax: 2.5, lightDistance: "20-35 cm", photoperiod: "16-18 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Orkide", comment: ""), icon: "🌸", category: "Flower", minPPFD: 100, maxPPFD: 250, minDLI: 6, maxDLI: 12, seedlingPPFD: 50, vegetativePPFD: 150, floweringPPFD: 200, fruitingPPFD: 200, minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80, co2: 800, phMin: 5.5, phMax: 6.5, ecMin: 0.5, ecMax: 1.5, lightDistance: "40-60 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Papatya", comment: ""), icon: "🌼", category: "Flower", minPPFD: 200, maxPPFD: 400, minDLI: 10, maxDLI: 18, seedlingPPFD: 100, vegetativePPFD: 280, floweringPPFD: 350, fruitingPPFD: 350, minTemp: 15, maxTemp: 24, nightTemp: 10, minHumidity: 50, maxHumidity: 70, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0, lightDistance: "25-40 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Lale", comment: ""), icon: "🌷", category: "Flower", minPPFD: 200, maxPPFD: 350, minDLI: 10, maxDLI: 16, seedlingPPFD: 100, vegetativePPFD: 250, floweringPPFD: 320, fruitingPPFD: 320, minTemp: 10, maxTemp: 20, nightTemp: 8, minHumidity: 50, maxHumidity: 70, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0, lightDistance: "30-45 cm", photoperiod: "12-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Aycicegi", comment: ""), icon: "🌻", category: "Flower", minPPFD: 500, maxPPFD: 900, minDLI: 25, maxDLI: 40, seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 850, minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 45, maxHumidity: 65, co2: 1000, phMin: 6.0, phMax: 7.0, ecMin: 1.2, ecMax: 2.5, lightDistance: "15-25 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Aloe Vera", comment: ""), icon: "🌵", category: "Succulent", minPPFD: 100, maxPPFD: 300, minDLI: 6, maxDLI: 14, seedlingPPFD: 50, vegetativePPFD: 180, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 18, maxTemp: 32, nightTemp: 12, minHumidity: 30, maxHumidity: 50, co2: 800, phMin: 6.0, phMax: 8.0, ecMin: 0.5, ecMax: 1.5, lightDistance: "30-50 cm", photoperiod: "12-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Kaktus", comment: ""), icon: "🌵", category: "Succulent", minPPFD: 200, maxPPFD: 600, minDLI: 12, maxDLI: 25, seedlingPPFD: 100, vegetativePPFD: 350, floweringPPFD: 500, fruitingPPFD: 550, minTemp: 18, maxTemp: 38, nightTemp: 10, minHumidity: 20, maxHumidity: 40, co2: 800, phMin: 6.0, phMax: 7.5, ecMin: 0.3, ecMax: 1.0, lightDistance: "20-40 cm", photoperiod: "10-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Echeveria", comment: ""), icon: "🌸", category: "Succulent", minPPFD: 150, maxPPFD: 400, minDLI: 8, maxDLI: 18, seedlingPPFD: 80, vegetativePPFD: 250, floweringPPFD: 350, fruitingPPFD: 360, minTemp: 15, maxTemp: 30, nightTemp: 10, minHumidity: 25, maxHumidity: 45, co2: 800, phMin: 6.0, phMax: 7.5, ecMin: 0.4, ecMax: 1.2, lightDistance: "25-45 cm", photoperiod: "10-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Haworthia", comment: ""), icon: "🌿", category: "Succulent", minPPFD: 50, maxPPFD: 200, minDLI: 4, maxDLI: 10, seedlingPPFD: 30, vegetativePPFD: 120, floweringPPFD: 170, fruitingPPFD: 180, minTemp: 16, maxTemp: 28, nightTemp: 12, minHumidity: 30, maxHumidity: 50, co2: 800, phMin: 6.5, phMax: 7.5, ecMin: 0.3, ecMax: 1.0, lightDistance: "40-60 cm", photoperiod: "10-12 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Sedum", comment: ""), icon: "🌱", category: "Succulent", minPPFD: 150, maxPPFD: 450, minDLI: 8, maxDLI: 20, seedlingPPFD: 80, vegetativePPFD: 280, floweringPPFD: 380, fruitingPPFD: 400, minTemp: 15, maxTemp: 30, nightTemp: 8, minHumidity: 25, maxHumidity: 50, co2: 800, phMin: 6.0, phMax: 7.5, ecMin: 0.4, ecMax: 1.2, lightDistance: "25-40 cm", photoperiod: "10-14 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Mikrogreens", comment: ""), icon: "🌱", category: "Other", minPPFD: 100, maxPPFD: 250, minDLI: 6, maxDLI: 12, seedlingPPFD: 80, vegetativePPFD: 150, floweringPPFD: 200, fruitingPPFD: 200, minTemp: 18, maxTemp: 24, nightTemp: 15, minHumidity: 60, maxHumidity: 80, co2: 800, phMin: 5.8, phMax: 6.5, ecMin: 0.8, ecMax: 1.6, lightDistance: "20-30 cm", photoperiod: "12-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Wheatgrass", comment: ""), icon: "🌾", category: "Other", minPPFD: 150, maxPPFD: 300, minDLI: 8, maxDLI: 14, seedlingPPFD: 80, vegetativePPFD: 200, floweringPPFD: 250, fruitingPPFD: 250, minTemp: 15, maxTemp: 22, nightTemp: 12, minHumidity: 60, maxHumidity: 80, co2: 800, phMin: 6.0, phMax: 7.0, ecMin: 0.8, ecMax: 1.6, lightDistance: "25-40 cm", photoperiod: "12-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Bambu", comment: ""), icon: "🎋", category: "Other", minPPFD: 200, maxPPFD: 500, minDLI: 12, maxDLI: 22, seedlingPPFD: 100, vegetativePPFD: 300, floweringPPFD: 400, fruitingPPFD: 450, minTemp: 18, maxTemp: 28, nightTemp: 15, minHumidity: 60, maxHumidity: 80, co2: 900, phMin: 6.0, phMax: 7.0, ecMin: 1.0, ecMax: 2.0, lightDistance: "20-35 cm", photoperiod: "14-16 h", lightType: "Full Spectrum"),
    Plant(name: NSLocalizedString("Cannabis", comment: ""), icon: "🌱", category: "Other", minPPFD: 600, maxPPFD: 900, minDLI: 30, maxDLI: 45, seedlingPPFD: 200, vegetativePPFD: 600, floweringPPFD: 800, fruitingPPFD: 900, minTemp: 20, maxTemp: 28, nightTemp: 18, minHumidity: 40, maxHumidity: 70, co2: 1500, phMin: 5.8, phMax: 6.5, ecMin: 0.8, ecMax: 3.0, lightDistance: "15-30 cm", photoperiod: "18/12 h", lightType: "Full Spectrum"),
]

var plantCategories: [String] {
    var seen = Set<String>()
    return plants.compactMap { seen.insert($0.category).inserted ? $0.category : nil }
}
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
    @State private var showLightMap = false
    @State private var countdown = 0
    @State private var countdownTimer: Timer? = nil

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
                            Text(NSLocalizedString("Grow Light Meter", comment: ""))
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: { showLightMap = true }) {
                            Image(systemName: "map.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 18))
                        }
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
                        .padding(.horizontal, 16).padding(.vertical, 10)
                        .background(Color(white: 0.12)).cornerRadius(10)
                    }
                    .padding(.horizontal)

                    Button(action: { showPlantPicker = true }) {
                        HStack {
                            Text(selectedPlant?.icon ?? "🌱")
                            Text(selectedPlant?.name ?? NSLocalizedString("Select Plant", comment: ""))
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(selectedPlant == nil ? .gray : .white)
                            Spacer()
                            if let plant = selectedPlant {
                                Text("\(Int(plant.minPPFD))–\(Int(plant.maxPPFD)) μmol")
                                    .font(.system(size: 11)).foregroundColor(.gray)
                            }
                            Image(systemName: "chevron.down")
                                .font(.system(size: 11)).foregroundColor(.gray)
                        }
                        .padding(.horizontal, 16).padding(.vertical, 10)
                        .background(Color(white: 0.12)).cornerRadius(10)
                    }
                    .padding(.horizontal)

                    if let plant = selectedPlant, camera.isRunning {
                        SufficiencyView(ppfd: camera.ppfd, plant: plant).padding(.horizontal)
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(white: 0.08))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green.opacity(0.3), lineWidth: 1))
                        VStack(spacing: 6) {
                            Text("PPFD")
                                .font(.system(size: 11, weight: .medium)).foregroundColor(.gray).tracking(3)
                            Text(camera.isRunning ? String(format: "%.0f", camera.ppfd) : "—")
                                .font(.system(size: 72, weight: .bold, design: .rounded))
                                .foregroundColor(.white).monospacedDigit()
                            Text("μmol/m²/s").font(.system(size: 13)).foregroundColor(.gray)
                            if camera.isRunning {
                                PPFDLevelBar(ppfd: camera.ppfd, plant: selectedPlant).padding(.top, 4)
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
                                    Text(NSLocalizedString("Photoperiod", comment: ""))
                                        .font(.system(size: 11)).foregroundColor(.gray)
                                    Spacer()
                                    Text("\(Int(photoperiod)) h/day")
                                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white)
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
                                Text(NSLocalizedString("Calibration", comment: ""))
                                    .font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(3)
                                Text(String(format: "%.3f", camera.calibrationFactor))
                                    .font(.system(size: 20, weight: .bold)).foregroundColor(.white)
                                Text("Apogee MQ-500").font(.system(size: 10)).foregroundColor(.gray)
                            }
                            Spacer()
                            Button(NSLocalizedString("Calibrate", comment: "")) { showCalibration = true }
                                .font(.system(size: 13, weight: .medium)).foregroundColor(.black)
                                .padding(.horizontal, 16).padding(.vertical, 8)
                                .background(Color.green).cornerRadius(8)
                        }
                        .padding(16)
                    }
                    .padding(.horizontal)

                    Button(action: {
                                            if camera.isRunning {
                                                camera.stopSession()
                                                countdown = 0
                                                countdownTimer?.invalidate()
                                            } else if countdown == 0 {
                                                countdown = 3
                                                countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
                                                    if countdown > 1 { countdown -= 1 }
                                                    else { t.invalidate(); countdown = 0; camera.requestPermissionAndStart() }
                                                }
                                            }
                                        }) {
                                            HStack(spacing: 10) {
                                                Image(systemName: camera.isRunning ? "stop.fill" : (countdown > 0 ? "timer" : "play.fill"))
                                                Text(camera.isRunning ? NSLocalizedString("Stop Measurement", comment: "") : (countdown > 0 ? "\(countdown)..." : NSLocalizedString("Start Measurement", comment: "")))
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16)
                                            .background(camera.isRunning ? Color.red : (countdown > 0 ? Color.orange : Color.green)).cornerRadius(14)
                                        }
                                        .padding(.horizontal)

                    if camera.isRunning {
                        Button(action: {
                            camera.saveMeasurement(lightSource: selectedLight.rawValue, plantName: selectedPlant?.name)
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "square.and.arrow.down")
                                Text(NSLocalizedString("Save Measurement", comment: ""))
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            .foregroundColor(.green).frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(Color.green.opacity(0.15)).cornerRadius(14)
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
        .sheet(isPresented: $showLightMap) { LightMapView(camera: camera, selectedPlant: selectedPlant) }
        .onChange(of: selectedLight) { _, light in camera.luxToPPFDFactor = light.luxToPPFD }
    }

    func dliCategory(_ dli: Double) -> String {
        switch dli {
        case 0..<6: return NSLocalizedString("Very Low", comment: "")
        case 6..<12: return NSLocalizedString("Low", comment: "")
        case 12..<20: return NSLocalizedString("Medium", comment: "")
        case 20..<30: return NSLocalizedString("Good", comment: "")
        case 30..<45: return NSLocalizedString("High", comment: "")
        default: return NSLocalizedString("Very High", comment: "")
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
struct LightMapView: View {
    @ObservedObject var camera: CameraManager
    let selectedPlant: Plant?
    @Environment(\.dismiss) var dismiss
    @State private var isScanning = false
    @State private var gridData: [[Double]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    @State private var currentRow = 0
    @State private var currentCol = 0
    @State private var scanComplete = false
    @State private var scanTimer: Timer? = nil
    @State private var countdown = 3
    @State private var countdownTimer: Timer? = nil
    @State private var showCountdown = false
    let gridSize = 5

    var minVal: Double { gridData.flatMap { $0 }.filter { $0 > 0 }.min() ?? 0 }
    var maxVal: Double { gridData.flatMap { $0 }.max() ?? 1 }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(NSLocalizedString("Light Map", comment: ""))
                            .font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                        Text(NSLocalizedString("5x5 PPFD Heat Map", comment: ""))
                            .font(.system(size: 11)).foregroundColor(.gray)
                    }
                    Spacer()
                    Button(NSLocalizedString("Close", comment: "")) { dismiss() }.foregroundColor(.gray)
                }
                .padding(20)

                if let plant = selectedPlant {
                    HStack {
                        Text(plant.icon)
                        Text("\(plant.name): \(Int(plant.minPPFD))–\(Int(plant.maxPPFD)) μmol/m²/s")
                            .font(.system(size: 12)).foregroundColor(.green)
                        Spacer()
                    }
                    .padding(.horizontal, 20).padding(.bottom, 8)
                }

                ScrollView {
                    VStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16).fill(Color(white: 0.08))
                            VStack(spacing: 4) {
                                ForEach(0..<gridSize, id: \.self) { row in
                                    HStack(spacing: 4) {
                                        ForEach(0..<gridSize, id: \.self) { col in
                                            let val = gridData[row][col]
                                            let isActive = isScanning && currentRow == row && currentCol == col
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 6)
                                                    .fill(cellColor(val: val, plant: selectedPlant))
                                                    .opacity(val == 0 ? 0.15 : 0.85)
                                                if isActive {
                                                    RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.white, lineWidth: 2)
                                                }
                                                if val > 0 {
                                                    Text(String(format: "%.0f", val))
                                                        .font(.system(size: 10, weight: .bold))
                                                        .foregroundColor(.white)
                                                } else {
                                                    Text("—").font(.system(size: 10))
                                                        .foregroundColor(Color(white: 0.4))
                                                }
                                            }
                                            .frame(height: 56).frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                            }
                            .padding(12)
                        }
                        .padding(.horizontal)

                        VStack(spacing: 6) {
                            Text(NSLocalizedString("PPFD Scale", comment: ""))
                                .font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
                            HStack(spacing: 0) {
                                ForEach(0..<10, id: \.self) { i in
                                    Rectangle()
                                        .fill(heatColor(ratio: Double(i) / 9.0))
                                        .frame(height: 14)
                                }
                            }
                            .cornerRadius(4)
                            HStack {
                                Text(NSLocalizedString("Low Scale", comment: "")).font(.system(size: 10)).foregroundColor(.gray)
                                Spacer()
                                if maxVal > 0 {
                                    Text(String(format: "%.0f μmol", maxVal)).font(.system(size: 10)).foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.horizontal)

                        if scanComplete {
                            let allVals = gridData.flatMap { $0 }.filter { $0 > 0 }
                            if !allVals.isEmpty {
                                let avg = allVals.reduce(0, +) / Double(allVals.count)
                                let minV = allVals.min() ?? 0
                                let maxV = allVals.max() ?? 0
                                let uniformity = minV / maxV * 100
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16).fill(Color(white: 0.08))
                                    VStack(spacing: 10) {
                                        Text(NSLocalizedString("Scan Results", comment: ""))
                                            .font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
                                        HStack(spacing: 0) {
                                            StatBox(label: NSLocalizedString("Avg", comment: ""), value: String(format: "%.0f", avg), unit: "μmol", color: .green)
                                            Divider().background(Color(white: 0.2)).frame(height: 40)
                                            StatBox(label: "Min", value: String(format: "%.0f", minV), unit: "μmol", color: .orange)
                                            Divider().background(Color(white: 0.2)).frame(height: 40)
                                            StatBox(label: "Max", value: String(format: "%.0f", maxV), unit: "μmol", color: .cyan)
                                            Divider().background(Color(white: 0.2)).frame(height: 40)
                                            StatBox(label: NSLocalizedString("Uniformity", comment: ""), value: String(format: "%.0f%%", uniformity), unit: "", color: uniformity > 70 ? .green : .orange)
                                        }
                                        if let plant = selectedPlant {
                                            let coverageCount = allVals.filter { $0 >= plant.minPPFD && $0 <= plant.maxPPFD }.count
                                            let coverage = Double(coverageCount) / Double(allVals.count) * 100
                                            HStack {
                                                Image(systemName: coverage > 60 ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
                                                    .foregroundColor(coverage > 60 ? .green : .orange)
                                                Text("\(plant.name): %\(Int(coverage))")
                                                    .font(.system(size: 13)).foregroundColor(.white)
                                                Spacer()
                                            }
                                            .padding(.horizontal, 4)
                                        }
                                    }
                                    .padding(16)
                                }
                                .padding(.horizontal)
                            }
                        }

                        if !isScanning && !scanComplete {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12).fill(Color(white: 0.08))
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("📋 \(NSLocalizedString("How To Use", comment: ""))")
                                        .font(.system(size: 13, weight: .semibold)).foregroundColor(.white)
                                    Text("1. Divide growing area into 5×5 zones")
                                        .font(.system(size: 12)).foregroundColor(.gray)
                                    Text("2. Hold phone in each zone")
                                        .font(.system(size: 12)).foregroundColor(.gray)
                                    Text("3. Wait 3 sec after start, auto measure")
                                        .font(.system(size: 12)).foregroundColor(.gray)
                                    Text("4. Map created after 25 points")
                                        .font(.system(size: 12)).foregroundColor(.gray)
                                }
                                .padding(14)
                            }
                            .padding(.horizontal)
                        }

                        VStack(spacing: 10) {
                            if showCountdown {
                                Text("\(countdown)")
                                    .font(.system(size: 48, weight: .bold, design: .rounded))
                                    .foregroundColor(.green)
                            }
                            if isScanning {
                                Text("Point \(currentRow * gridSize + currentCol + 1)/\(gridSize * gridSize)")
                                    .font(.system(size: 13)).foregroundColor(.gray)
                                Button(NSLocalizedString("Stop Scan", comment: "")) { stopScan() }
                                    .font(.system(size: 15, weight: .semibold)).foregroundColor(.red)
                                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                                    .background(Color.red.opacity(0.15)).cornerRadius(12).padding(.horizontal)
                            } else {
                                Button(scanComplete ? NSLocalizedString("Rescan", comment: "") : NSLocalizedString("Start Scan", comment: "")) { startScan() }
                                    .font(.system(size: 16, weight: .semibold)).foregroundColor(.black)
                                    .frame(maxWidth: .infinity).padding(.vertical, 16)
                                    .background(Color.green).cornerRadius(14).padding(.horizontal)
                            }
                        }
                        Spacer().frame(height: 32)
                    }
                }
            }
        }
    }

    func cellColor(val: Double, plant: Plant?) -> Color {
        if val == 0 { return Color(white: 0.2) }
        if let plant = plant {
            if val < plant.minPPFD * 0.5 { return .red }
            if val < plant.minPPFD { return .orange }
            if val <= plant.maxPPFD { return .green }
            return .yellow
        }
        let ratio = min((val - minVal) / max(maxVal - minVal, 1), 1.0)
        return heatColor(ratio: ratio)
    }

    func heatColor(ratio: Double) -> Color {
        switch ratio {
        case 0..<0.25: return .blue
        case 0.25..<0.5: return .cyan
        case 0.5..<0.75: return .green
        case 0.75..<0.9: return .yellow
        default: return .red
        }
    }

    func startScan() {
        scanComplete = false
        gridData = Array(repeating: Array(repeating: 0, count: gridSize), count: gridSize)
        currentRow = 0; currentCol = 0
        if !camera.isRunning { camera.requestPermissionAndStart() }
        isScanning = true
        scheduleNextCell()
    }

    func stopScan() {
        isScanning = false
        scanTimer?.invalidate()
        countdownTimer?.invalidate()
        showCountdown = false
    }

    func scheduleNextCell() {
        guard isScanning else { return }
        countdown = 3; showCountdown = true
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            if countdown > 1 { countdown -= 1 }
            else { t.invalidate(); showCountdown = false; captureCell() }
        }
    }

    func captureCell() {
        guard isScanning else { return }
        gridData[currentRow][currentCol] = camera.ppfd
        if let (r, c) = nextCell() { currentRow = r; currentCol = c; scheduleNextCell() }
        else { isScanning = false; scanComplete = true }
    }

    func nextCell() -> (Int, Int)? {
        var c = currentCol + 1; var r = currentRow
        if c >= gridSize { c = 0; r += 1 }
        if r >= gridSize { return nil }
        return (r, c)
    }
}

struct StatBox: View {
    let label: String; let value: String; let unit: String; let color: Color
    var body: some View {
        VStack(spacing: 2) {
            Text(label).font(.system(size: 10)).foregroundColor(.gray)
            Text(value).font(.system(size: 16, weight: .bold)).foregroundColor(color)
            if !unit.isEmpty { Text(unit).font(.system(size: 9)).foregroundColor(.gray) }
        }
        .frame(maxWidth: .infinity)
    }
}
struct PlantPickerView: View {
    @Binding var selected: Plant?
    @Environment(\.dismiss) var dismiss
    @State private var detailPlant: Plant? = nil
    @State private var selectedCategory: String = "All"
    @State private var searchText: String = ""

    var categories: [String] { [NSLocalizedString("All", comment: "")] + plantCategories }

    var filteredPlants: [Plant] {
        plants.filter { plant in
            let catMatch = selectedCategory == NSLocalizedString("All", comment: "") || plant.category == selectedCategory
            let searchMatch = searchText.isEmpty || plant.name.localizedCaseInsensitiveContains(searchText)
            return catMatch && searchMatch
        }
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text(NSLocalizedString("Select Plant", comment: ""))
                        .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Button(NSLocalizedString("Close", comment: "")) { dismiss() }.foregroundColor(.gray)
                }
                .padding(20)

                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField(NSLocalizedString("Search plant", comment: ""), text: $searchText)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 12).padding(.vertical, 8)
                .background(Color(white: 0.12)).cornerRadius(10)
                .padding(.horizontal, 20).padding(.bottom, 10)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(categories, id: \.self) { cat in
                            Button(action: { selectedCategory = cat }) {
                                Text(cat)
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(selectedCategory == cat ? .black : .gray)
                                    .padding(.horizontal, 12).padding(.vertical, 6)
                                    .background(selectedCategory == cat ? Color.green : Color(white: 0.15))
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 8)

                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(filteredPlants) { plant in
                            HStack(spacing: 14) {
                                Button(action: { selected = plant; dismiss() }) {
                                    HStack(spacing: 14) {
                                        Text(plant.icon).font(.system(size: 24)).frame(width: 36)
                                        VStack(alignment: .leading, spacing: 2) {
                                            HStack(spacing: 6) {
                                                Text(plant.name).font(.system(size: 15, weight: .medium)).foregroundColor(.white)
                                                Text(plant.category)
                                                    .font(.system(size: 10)).foregroundColor(.green)
                                                    .padding(.horizontal, 6).padding(.vertical, 2)
                                                    .background(Color.green.opacity(0.15)).cornerRadius(4)
                                            }
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
    let stages = [
        NSLocalizedString("Seedling", comment: ""),
        NSLocalizedString("Vegetative", comment: ""),
        NSLocalizedString("Flowering", comment: ""),
        NSLocalizedString("Harvest", comment: "")
    ]

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
                            HStack(spacing: 6) {
                                Text(plant.category).font(.system(size: 12)).foregroundColor(.green)
                                Text("·").foregroundColor(.gray)
                                Text(plant.lightType).font(.system(size: 12)).foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        Button(NSLocalizedString("Close", comment: "")) { dismiss() }.foregroundColor(.gray)
                    }
                    .padding()

                    VStack(spacing: 10) {
                        Text(NSLocalizedString("Growth Stage", comment: ""))
                            .font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2)
                        Picker("Stage", selection: $selectedStage) {
                            ForEach(0..<stages.count, id: \.self) { i in Text(stages[i]).tag(i) }
                        }
                        .pickerStyle(.segmented).padding(.horizontal)
                        HStack {
                            VStack {
                                Text(NSLocalizedString("Target PPFD", comment: "")).font(.system(size: 11)).foregroundColor(.gray)
                                Text("\(Int(stagePPFD))").font(.system(size: 36, weight: .bold)).foregroundColor(.green)
                                Text("μmol/m²/s").font(.system(size: 11)).foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                Text(NSLocalizedString("DLI Range", comment: "")).font(.system(size: 11)).foregroundColor(.gray)
                                Text("\(Int(plant.minDLI))–\(Int(plant.maxDLI))").font(.system(size: 36, weight: .bold)).foregroundColor(.cyan)
                                Text("mol/m²/day").font(.system(size: 11)).foregroundColor(.gray)
                            }
                        }
                        .padding().background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
                    }

                    DetailSection(title: NSLocalizedString("Light Optimization", comment: ""), icon: "💡") {
                        DetailRow(label: NSLocalizedString("LED Distance", comment: ""), value: plant.lightDistance)
                        DetailRow(label: NSLocalizedString("Photoperiod", comment: ""), value: plant.photoperiod)
                        DetailRow(label: NSLocalizedString("Light Type", comment: ""), value: plant.lightType)
                    }
                    DetailSection(title: NSLocalizedString("Temperature Humidity", comment: ""), icon: "🌡️") {
                        DetailRow(label: NSLocalizedString("Day Temperature", comment: ""), value: "\(Int(plant.minTemp))–\(Int(plant.maxTemp))°C")
                        DetailRow(label: NSLocalizedString("Night Temperature", comment: ""), value: "\(Int(plant.nightTemp))°C")
                        DetailRow(label: NSLocalizedString("Humidity", comment: ""), value: "\(Int(plant.minHumidity))–\(Int(plant.maxHumidity))%")
                        DetailRow(label: "CO₂", value: "\(plant.co2) ppm")
                    }
                    DetailSection(title: NSLocalizedString("Hydroponics", comment: ""), icon: "💧") {
                        DetailRow(label: NSLocalizedString("pH Range", comment: ""), value: "\(plant.phMin)–\(plant.phMax)")
                        DetailRow(label: NSLocalizedString("EC Value", comment: ""), value: "\(plant.ecMin)–\(plant.ecMax) mS/cm")
                    }
                }
                .padding(.bottom, 32)
            }
        }
    }
}
struct SufficiencyView: View {
    let ppfd: Double; let plant: Plant
    var status: (text: String, color: Color, icon: String) {
        if ppfd < plant.minPPFD * 0.5 { return (NSLocalizedString("Light Too Low", comment: ""), .red, "exclamationmark.triangle.fill") }
        else if ppfd < plant.minPPFD { return (NSLocalizedString("Light Insufficient", comment: ""), .orange, "exclamationmark.circle.fill") }
        else if ppfd <= plant.maxPPFD { return (NSLocalizedString("Light Sufficient ✓", comment: ""), .green, "checkmark.circle.fill") }
        else { return (NSLocalizedString("Light Excess", comment: ""), .yellow, "exclamationmark.circle.fill") }
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
        .padding(14).background(status.color.opacity(0.1)).cornerRadius(10)
    }
}

struct MetricCard: View {
    let title: String; let value: String; let unit: String; let color: Color
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
    let ppfd: Double; let plant: Plant?
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
            HStack { Text("0"); Spacer(); Text("250"); Spacer(); Text("500"); Spacer(); Text("750"); Spacer(); Text("1000+") }
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
                Text(NSLocalizedString("Light Source", comment: ""))
                    .font(.system(size: 18, weight: .bold)).foregroundColor(.white).padding(20)
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

struct DetailSection<Content: View>: View {
    let title: String; let icon: String
    @ViewBuilder let content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack { Text(icon); Text(title).font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2) }
                .padding(.horizontal).padding(.bottom, 8)
            VStack(spacing: 0) { content }.background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
        }
    }
}

struct DetailRow: View {
    let label: String; let value: String
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
                    Text(NSLocalizedString("Measurement History", comment: ""))
                        .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        if let url = camera.exportCSV() {
                            let av = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                               let window = windowScene.windows.first, let rootVC = window.rootViewController {
                                var topVC = rootVC
                                while let presented = topVC.presentedViewController { topVC = presented }
                                topVC.present(av, animated: true)
                            }
                        }
                    }) { Image(systemName: "square.and.arrow.up").foregroundColor(.green).font(.system(size: 15)) }
                    .padding(.trailing, 12)
                    Button(NSLocalizedString("Delete All", comment: "")) {
                        camera.measurements.removeAll()
                        UserDefaults.standard.removeObject(forKey: "measurements")
                    }
                    .foregroundColor(.red).font(.system(size: 13)).padding(.trailing, 12)
                    Button(NSLocalizedString("Close", comment: "")) { dismiss() }.foregroundColor(.gray)
                }
                .padding(20)
                if camera.measurements.isEmpty {
                    Spacer()
                    Text(NSLocalizedString("No measurements saved yet", comment: ""))
                        .foregroundColor(.gray).font(.system(size: 14))
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
                                    Spacer(); Text(m.date, style: .date)
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
                        Text(NSLocalizedString("Settings", comment: ""))
                            .font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                        Spacer()
                        Button(NSLocalizedString("Close", comment: "")) { dismiss() }.foregroundColor(.gray)
                    }
                    .padding()
                    SettingsSection(title: NSLocalizedString("Diffuser", comment: ""), icon: "📋") {
                        SettingsRow {
                            Text(NSLocalizedString("Diffuser Reminder", comment: "")).foregroundColor(.white).font(.system(size: 15))
                            Spacer()
                            Toggle("", isOn: $diffuserReminder).tint(.green)
                        }
                        if diffuserReminder {
                            SettingsRow {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("💡 \(NSLocalizedString("Reminder Active", comment: ""))")
                                        .font(.system(size: 13, weight: .medium)).foregroundColor(.green)
                                    Text(NSLocalizedString("Diffuser reminder text", comment: ""))
                                        .font(.system(size: 11)).foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                    }
                    SettingsSection(title: NSLocalizedString("Calibration", comment: ""), icon: "🎯") {
                        SettingsRow {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(NSLocalizedString("Calibration Factor", comment: "")).foregroundColor(.white).font(.system(size: 15))
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
                                    Text(NSLocalizedString("Reset Calibration", comment: ""))
                                }
                                .foregroundColor(.red).font(.system(size: 15))
                            }
                            Spacer()
                        }
                    }
                    SettingsSection(title: NSLocalizedString("About", comment: ""), icon: "ℹ️") {
                        SettingsRow {
                            Text(NSLocalizedString("App", comment: "")).foregroundColor(.gray).font(.system(size: 14))
                            Spacer()
                            Text("GrowPAR v1.1").foregroundColor(.white).font(.system(size: 14))
                        }
                        SettingsRow {
                            Text(NSLocalizedString("Sensor", comment: "")).foregroundColor(.gray).font(.system(size: 14))
                            Spacer()
                            Text("Camera + Apogee MQ-500").foregroundColor(.white).font(.system(size: 14))
                        }
                        SettingsRow {
                            Text(NSLocalizedString("Developer", comment: "")).foregroundColor(.gray).font(.system(size: 14))
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
    let title: String; let icon: String
    @ViewBuilder let content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack { Text(icon); Text(title).font(.system(size: 10, weight: .medium)).foregroundColor(.gray).tracking(2) }
                .padding(.horizontal).padding(.bottom, 8)
            VStack(spacing: 0) { content }.background(Color(white: 0.08)).cornerRadius(12).padding(.horizontal)
        }
    }
}

struct SettingsRow<Content: View>: View {
    @ViewBuilder let content: Content
    var body: some View {
        VStack(spacing: 0) {
            HStack { content }.padding(.horizontal, 16).padding(.vertical, 12)
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
                Text(NSLocalizedString("Calibration", comment: ""))
                    .font(.system(size: 24, weight: .bold)).foregroundColor(.white).padding(.top, 32)
                VStack(alignment: .leading, spacing: 8) {
                    Text(NSLocalizedString("Apogee reference value", comment: "")).font(.system(size: 13)).foregroundColor(.gray)
                    TextField("e.g. 450", text: $referenceValue)
                        .keyboardType(.decimalPad).font(.system(size: 20)).foregroundColor(.white)
                        .padding().background(Color(white: 0.12)).cornerRadius(10)
                }
                .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text(NSLocalizedString("Current reading", comment: "")).font(.system(size: 13)).foregroundColor(.gray)
                    Text(String(format: "%.1f μmol/m²/s", camera.ppfd))
                        .font(.system(size: 20, weight: .semibold)).foregroundColor(.green)
                        .padding().frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(white: 0.12)).cornerRadius(10)
                }
                .padding(.horizontal)
                Button(NSLocalizedString("Apply Calibration", comment: "")) {
                    if let ref = Double(referenceValue), camera.ppfd > 0 {
                        camera.calibrationFactor = ref / (camera.ppfd / camera.calibrationFactor)
                        UserDefaults.standard.set(camera.calibrationFactor, forKey: "calibrationFactor")
                    }
                    dismiss()
                }
                .font(.system(size: 16, weight: .semibold)).foregroundColor(.black)
                .frame(maxWidth: .infinity).padding(.vertical, 16)
                .background(Color.green).cornerRadius(14).padding(.horizontal)
                Button(NSLocalizedString("Cancel", comment: "")) { dismiss() }.foregroundColor(.gray)
                Spacer()
            }
        }
    }
}
