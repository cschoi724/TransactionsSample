//
//  TransactionRepositoryImpl.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Combine
import Foundation

final class DefaultTransactionRepository: TransactionRepository {
    private let fileName: String
    private let bundle: Bundle

    init(fileName: String = "mockdata", bundle: Bundle = .main) {
        self.fileName = fileName
        self.bundle = bundle
    }
    
    func fetchTransactions() -> AnyPublisher<[TransactionItem], ServiceError> {
        return Future<[TransactionDTO], ServiceError> { promise in
            guard let transactions: [TransactionDTO] = JsonLoader.load(
                type: [TransactionDTO].self, fileName: self.fileName, bundle: self.bundle
            ) else {
                promise(.failure(.dataLoadError))
                return
            }
            promise(.success(transactions))
        }
        .map { dto in
            dto.map { $0.domain }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
