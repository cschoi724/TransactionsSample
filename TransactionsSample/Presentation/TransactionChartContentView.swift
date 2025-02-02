//
//  TransactionChartContentView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct TransactionChartContentView: View {
    let transactions: [TransactionItem]
    let selectedTab: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.green.opacity(0.2))
                
            }
        }
        .frame(height: 200)
    }
}
