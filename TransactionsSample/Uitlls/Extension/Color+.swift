//
//  Color+.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

extension Color {
    init(_ hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&int)

        let r, g, b: Double
        if hexSanitized.count == 6 {
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        } else {
            r = 1.0
            g = 1.0
            b = 1.0
        }

        self.init(red: r, green: g, blue: b)
    }
}
