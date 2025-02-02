//
//  TransactionListView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionItem]

    var body: some View {
        List(transactions) { transaction in
            TransactionRow(transaction: transaction)
                .listRowSeparator(.hidden)
                .padding(.bottom, 10)
        }
        .listStyle(PlainListStyle())
        .frame(height: listHeight())
        .scrollDisabled(true)
    }
    
    private func listHeight() -> CGFloat {
        let rowHeight: CGFloat = 51
        let rowSpacing: CGFloat = 35
        let totalRows = max(0, CGFloat(transactions.count))

        if transactions.isEmpty {
            return 0
        }
        return (totalRows * rowHeight) + ((totalRows - 1) * rowSpacing)
    }
}

struct TransactionRow: View {
    let transaction: TransactionItem

    var body: some View {
        HStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)

                Text(transaction.type)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(transaction.amount)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(transaction.amount.contains("-") ? Color("#363062") : Color("#6FCF97"))

                Text(formattedDate(from: transaction.timestamp))
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 51)
    }

    private func formattedDate(from timestamp: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "yyyy.MM.dd HH:mm"

        if let date = isoFormatter.date(from: timestamp) {
            return displayFormatter.string(from: date)
        }
        return "Invalid Date"
    }
}
