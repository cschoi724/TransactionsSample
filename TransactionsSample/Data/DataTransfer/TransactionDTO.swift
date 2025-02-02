//
//  TransactionDTO.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

struct TransactionDTO: Codable {
    let amount: String
    let name: String
    let timestamp: String
    let type: String
}

extension TransactionDTO {
    var domain: TransactionItem {
        .init(amount: amount, name: name, timestamp: timestamp, type: type)
    }
}
