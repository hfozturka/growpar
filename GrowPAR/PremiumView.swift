import SwiftUI

struct PremiumView: View {
    @ObservedObject var store = StoreManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var isPurchasing = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 24) {
                    HStack {
                        Spacer()
                        Button(NSLocalizedString("Close", comment: "")) { dismiss() }
                            .foregroundColor(.gray)
                    }
                    .padding()

                    Text("⭐️")
                        .font(.system(size: 64))

                    Text("GrowPAR Premium")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)

                    Text(NSLocalizedString("Ad-free experience", comment: ""))
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    VStack(spacing: 12) {
                        FeatureRow(icon: "nosign", text: NSLocalizedString("No Ads", comment: ""))
                        FeatureRow(icon: "star.fill", text: NSLocalizedString("Support Developer", comment: ""))
                        FeatureRow(icon: "leaf.fill", text: NSLocalizedString("All Features", comment: ""))
                    }
                    .padding(.horizontal)

                    VStack(spacing: 12) {
                        if let monthly = store.monthlyProduct {
                            Button(action: {
                                isPurchasing = true
                                Task {
                                    await store.purchase(store.monthlyID)
                                    isPurchasing = false
                                    if store.isPremium { dismiss() }
                                }
                            }) {
                                HStack {
                                    Text(NSLocalizedString("Monthly", comment: ""))
                                        .font(.system(size: 16, weight: .semibold))
                                    Spacer()
                                    Text(monthly.displayPrice + NSLocalizedString("/month", comment: ""))
                                        .font(.system(size: 16, weight: .bold))
                                }
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(14)
                            }
                        }

                        if let yearly = store.yearlyProduct {
                            Button(action: {
                                isPurchasing = true
                                Task {
                                    await store.purchase(store.yearlyID)
                                    isPurchasing = false
                                    if store.isPremium { dismiss() }
                                }
                            }) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(NSLocalizedString("Yearly", comment: ""))
                                            .font(.system(size: 16, weight: .semibold))
                                        Text(NSLocalizedString("Best Value", comment: ""))
                                            .font(.system(size: 11))
                                            .opacity(0.8)
                                    }
                                    Spacer()
                                    Text(yearly.displayPrice + NSLocalizedString("/year", comment: ""))
                                        .font(.system(size: 16, weight: .bold))
                                }
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.cyan)
                                .cornerRadius(14)
                            }
                        }
                    }
                    .padding(.horizontal)

                    if isPurchasing {
                        ProgressView()
                            .tint(.green)
                    }

                    Button(NSLocalizedString("Restore Purchases", comment: "")) {
                        Task { await store.restorePurchases() }
                    }
                    .foregroundColor(.gray)
                    .font(.system(size: 13))

                    Spacer().frame(height: 32)
                }
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.system(size: 18))
                .frame(width: 28)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 15))
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
