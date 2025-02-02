//
//  TransactionChartView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI
import ComposableArchitecture

struct TransactionChartView: View {
    let transactions: [TransactionItem]
    let viewStore: ViewStore<TransactionFeature.State, TransactionFeature.Action>

    var body: some View {
        VStack {
            TransactionTabView(selectedTab: viewStore.selectedTab) { selectedTab in
                viewStore.send(.tabChanged(selectedTab))
            }
            TransactionChartHeaderView()

            TransactionChartContentView(
                transactions: transactions,
                selectedTab: viewStore.selectedTab
            )
            //.frame(height: 200)
            .padding(.horizontal)
        }
    }
}

struct TransactionChartHeaderView: View {
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 8) {
                Rectangle()
                    .fill(Color("#363062"))
                    .frame(width: 32, height: 5)
                Text("Income")
                    .font(.system(size: 12))
                    .foregroundColor(Color("#363062"))
            }
            
            HStack(spacing: 8) {
                Rectangle()
                    .fill(Color("#6FCF97"))
                    .frame(width: 32, height: 5)
                Text("Expense")
                    .font(.system(size: 12))
                    .foregroundColor(Color("#363062"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 28)
    }
}
