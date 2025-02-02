//
//  FetchTransactionListUseCase.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//
import Combine

protocol FetchTransactionListUseCase {
    func execute() -> AnyPublisher<[TransactionItem], ServiceError>
}

final class DefaultFetchTransactionListUseCase: FetchTransactionListUseCase {
    private let repository: TransactionRepository
    
    init(repository: TransactionRepository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[TransactionItem], ServiceError> {
        return repository.fetchTransactions()
    }
}
