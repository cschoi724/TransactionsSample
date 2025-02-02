//
//  RecentTransactionsView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct RecentTransactionsView: View {
    @State private var selectedTab: String = "All"

    let transactions: [TransactionItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent Transactions")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.horizontal, 16)
            TransactionFilterTabs(selectedTab: $selectedTab)
            TransactionListView(transactions: filteredTransactions())
        }
        .padding(.top, 16)
    }

    private func filteredTransactions() -> [TransactionItem] {
        switch selectedTab {
        case "Expense":
            return transactions.filter { Double($0.amount) ?? 0 < 0 }
                .sorted { $0.timestamp > $1.timestamp }
                .prefix(10)
                .map { $0 }
        case "Income":
            return transactions.filter { Double($0.amount) ?? 0 >= 0 }
                .sorted { $0.timestamp > $1.timestamp }
                .prefix(10)
                .map { $0 }
        default:
            return transactions.sorted { $0.timestamp > $1.timestamp }
                .prefix(20)
                .map { $0 }
        }
    }
}

private struct TransactionFilterTabs: View {
    @Binding var selectedTab: String

    private let tabs = ["All", "Expense", "Income"]

    var body: some View {
        HStack(spacing: 16) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    Text(tab)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(selectedTab == tab ? Color("#363062") : Color.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.clear)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
