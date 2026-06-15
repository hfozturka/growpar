import SwiftUI
import GoogleMobileAds

@main
struct GrowPARApp: App {
    
    init() {
        MobileAds.shared.start()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
