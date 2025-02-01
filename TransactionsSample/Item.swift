//
//  Item.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
