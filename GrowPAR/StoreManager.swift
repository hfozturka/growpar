import StoreKit
import SwiftUI

@MainActor
class StoreManager: ObservableObject {
    @Published var isPremium = false
    
    static let shared = StoreManager()
    
    let monthlyID = "com.hfozturka.growparios.premium.monthly"
    let yearlyID = "com.hfozturka.growparios.premium.yearly"
    
    private var products: [Product] = []
    
    init() {
        Task {
            await loadProducts()
            await updatePurchaseStatus()
        }
    }
    
    func loadProducts() async {
        do {
            products = try await Product.products(for: [monthlyID, yearlyID])
        } catch {
            print("Product load error: \(error)")
        }
    }
    
    func purchase(_ productID: String) async {
        guard let product = products.first(where: { $0.id == productID }) else { return }
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                switch verification {
                case .verified(_):
                    await updatePurchaseStatus()
                case .unverified:
                    break
                }
            default:
                break
            }
        } catch {
            print("Purchase error: \(error)")
        }
    }
    
    func updatePurchaseStatus() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result {
                if transaction.productID == monthlyID || transaction.productID == yearlyID {
                    isPremium = true
                    return
                }
            }
        }
        isPremium = false
    }
    
    func restorePurchases() async {
        try? await AppStore.sync()
        await updatePurchaseStatus()
    }
    
    var monthlyProduct: Product? { products.first(where: { $0.id == monthlyID }) }
    var yearlyProduct: Product? { products.first(where: { $0.id == yearlyID }) }
}
