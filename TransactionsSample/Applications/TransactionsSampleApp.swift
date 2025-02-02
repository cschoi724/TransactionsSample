//
//  TransactionsSampleApp.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import SwiftUI
import Swinject
import ComposableArchitecture

@main
struct TransactionsSampleApp: App {
    let container = AppAssembly.shared.container

    var body: some Scene {
        let store = container.resolve(Store<TransactionFeature.State, TransactionFeature.Action>.self)!
        WindowGroup {
            TransactionView(store: store)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let store = AppAssembly.shared.container.resolve(Store<TransactionFeature.State, TransactionFeature.Action>.self)!
        TransactionView(store: store)
    }
}
