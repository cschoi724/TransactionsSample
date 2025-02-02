//
//  TransactionTabView.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//

import SwiftUI

struct TransactionTabView: View {
    let selectedTab: String
    let onTabSelected: (String) -> Void
    
    private let tabs = ["Week", "Month"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                TabButton(
                    title: tab,
                    isSelected: selectedTab == tab,
                    onTap: { onTabSelected(tab) }
                )
            }
        }
        .background(Color("#F5F5F5"))
        .frame(width: 172, height: 34)
        .cornerRadius(20)
        .padding(.leading, 28)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct TabButton: View {
    let title: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 86, height: 34)
                .background(isSelected ? Color("#363062") : Color.clear)
                .cornerRadius(20)
                .foregroundColor(isSelected ? Color.white : Color("#6B6B6B"))
        }
    }
}
