//
//  AppAssembly.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import Swinject

final class AppAssembly {
    static let shared = AppAssembly()
    let container: Container

    private init() {
        container = Container()
        let assemblies: [Assembly] = [
            DataAssembly(),
            DomainAssembly(),
            PresentationAssembly()
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }
}
