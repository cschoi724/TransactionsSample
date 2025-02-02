//
//  TransactionFeature.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import ComposableArchitecture
import Combine
import Foundation

struct TransactionFeature: Reducer {
    struct State: Equatable {
        var transactions: [TransactionItem] = []
        var isLoading: Bool = false
        var errorMessage: String?
        var selectedTab: String = "Week" // "Week" or "Month"
    }
    
    enum Action: Equatable {
        case fetchTransactions
        case transactionsLoaded(Result<[TransactionItem], ServiceError>)
        case tabChanged(String)
    }
    
    struct Environment {
        let fetchTransactionListUseCase: FetchTransactionListUseCase
    }
    
    private let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .fetchTransactions:
            state.isLoading = true
            return Effect.publisher {
                environment.fetchTransactionListUseCase.execute()
                    .map { .transactionsLoaded(.success($0)) }
                    .catch { Just(.transactionsLoaded(.failure($0))) }
            }
            
        case let .transactionsLoaded(result):
            state.isLoading = false
            switch result {
            case .success(let transactions):
                print(transactions.prefix(20))
                let isoFormatter = ISO8601DateFormatter()
                state.transactions = transactions.sorted {
                    guard let date1 = isoFormatter.date(from: $0.timestamp),
                          let date2 = isoFormatter.date(from: $1.timestamp) else {
                        return false
                    }
                    return date1 > date2
                }
            case .failure(let error):
                state.errorMessage = "Failed to load transactions: \(error)"
            }
            return .none

        case let .tabChanged(tab):
            state.selectedTab = tab
            return .none
        }
    }
}
