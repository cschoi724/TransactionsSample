//
//  Transaction.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Foundation

// 거래 데이터를 표현하는 Entity
struct TransactionItem: Equatable, Identifiable {
    let id: String
    let amount: String // 금액
    let name: String // 거래자 이름
    let timestamp: String // 거래 시간
    let type: String // 거래 유형 (예: "transfer")
    
    init(id: String = UUID().uuidString, amount: String, name: String, timestamp: String, type: String) {
        self.id = id
        self.amount = amount
        self.name = name
        self.timestamp = timestamp
        self.type = type
    }
}

extension TransactionItem {
    var formattedDate: String {
        let isoFormatter = ISO8601DateFormatter()
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MM.dd HH:mm"

        if let date = isoFormatter.date(from: timestamp) {
            return displayFormatter.string(from: date)
        }
        return "Invalid Date"
    }

    var dynamicType: String {
        if let amountValue = Double(amount) {
            return amountValue >= 0 ? "income" : "expense"
        }
        return "unknown"
    }
}
