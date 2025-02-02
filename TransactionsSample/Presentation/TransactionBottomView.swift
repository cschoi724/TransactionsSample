//
//  TransactionBottomView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct TransactionBottomView: View {
    var body: some View {
        ZStack {
            HStack {
                Button(action: {}) {
                    Image("icDashboadDeselelected")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }.frame(width: 80, height: 67)
                Button(action: {}) {
                    Image("icCardDeselelected")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }.frame(width: 80, height: 67)
                Button(action: {}) {
                    Image("icActivitySelelected")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }.frame(width: 80, height: 67)
                Button(action: {}) {
                    Image("icMyDeselelected")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }.frame(width: 80, height: 67)
            }
            .padding(.horizontal, 28)
            
        }
        .frame(height: 67)
    }
}
