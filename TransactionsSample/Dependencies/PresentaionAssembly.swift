//
//  PresentaionAssembly.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/2/25.
//
import Swinject
import ComposableArchitecture

final class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TransactionFeature.self) { resolver in
            return TransactionFeature(
                environment: .init(
                    fetchTransactionListUseCase: resolver.resolve(FetchTransactionListUseCase.self)!
                )
            )
        }
        
        container.register(StoreOf<TransactionFeature>.self) { resolver in
            return StoreOf<TransactionFeature>(
                initialState: TransactionFeature.State(),
                reducer: {
                    resolver.resolve(TransactionFeature.self)!
                }
            )

        }
        
        container.register(TransactionView.self) { resolver in
            let store = resolver.resolve(StoreOf<TransactionFeature>.self)!
            return TransactionView(store: store)
        }
    }
}
