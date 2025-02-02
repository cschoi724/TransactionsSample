//
//  DomainAssembly.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Swinject

final class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchTransactionListUseCase.self) { resolver in
            let repository = resolver.resolve(TransactionRepository.self)!
            return DefaultFetchTransactionListUseCase(repository: repository)
        }
        .inObjectScope(.container)
    }
}
