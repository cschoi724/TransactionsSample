//
//  DataAssembly.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Swinject
import Foundation

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TransactionRepository.self) { _ in
            DefaultTransactionRepository(fileName: "mockdata")
        }
        .inObjectScope(.container)
    }
}
