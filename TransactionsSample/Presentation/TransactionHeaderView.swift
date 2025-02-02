
//
//  TransactionHeaderView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct TransactionHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 22)
            Text("Transactions")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.leading, 28)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 102, alignment: .topLeading)
    }
}
