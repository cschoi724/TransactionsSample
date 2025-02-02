//
//  TransactionView.swift
//  TransactionsSample
//

import SwiftUI
import ComposableArchitecture

struct TransactionView: View {
    let store: StoreOf<TransactionFeature>
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                TransactionHeaderView()
                ScrollView {
                    VStack(spacing: 16) {
                        GeometryReader { proxy in
                            TransactionChartView(
                                transactions: viewStore.transactions,
                                viewStore: viewStore
                            )
                        }
                        .frame(height: 250)
                        RecentTransactionsView(transactions: viewStore.transactions)
                            .onPreferenceChange(ScrollOffsetKey.self) { value in
                                scrollOffset = max(0, value)
                            }
                    }
                    .padding(.horizontal, 16)
                }
                TransactionBottomView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
                viewStore.send(.fetchTransactions)
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

