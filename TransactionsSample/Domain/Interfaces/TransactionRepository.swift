//
//  TransactionRepository.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Combine

protocol TransactionRepository {
    func fetchTransactions() -> AnyPublisher<[TransactionItem], ServiceError>
}
