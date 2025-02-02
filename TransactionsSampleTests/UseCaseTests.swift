//
//  UseCaseTests.swift
//  TransactionsSample
//
//  Created by 일하는석찬 on 2/1/25.
//

import XCTest
import Combine
@testable import TransactionsSample

final class UseCaseTests: XCTestCase {
    
    private var useCase: FetchTransactionListUseCase!
    private var repository: TransactionRepository!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let testBundle = Bundle(for: Self.self)
        
        repository = DefaultTransactionRepository(fileName: "mockdata", bundle: testBundle)
        useCase = DefaultFetchTransactionListUseCase(repository: repository)
    }

    override func tearDownWithError() throws {
        useCase = nil
        repository = nil
        cancellables.removeAll()
        try super.tearDownWithError()
    }

    func test_fetchTransactions_success() throws {
        // Given: UseCase 가 정상적으로 데이터를 불러오는지 확인
        let expectation = expectation(description: "Fetch transactions successfully")

        // When: execute() 실행
        useCase.execute()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTFail("Error occurred: \(error)")
                }
            }, receiveValue: { transactions in
                // Then: 데이터를 정상적으로 받았는지 확인
                XCTAssertFalse(transactions.isEmpty, "Transactions should not be empty")
                XCTAssertGreaterThan(transactions.count, 0, "Transactions count should be greater than 0")

                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    func test_fetchTransactions_failure_whenFileNotFound() throws {
        // Given: 존재하지 않는 파일명을 가진 레포지토리 사용
        let repository = DefaultTransactionRepository(fileName: "non_existing_file", bundle: Bundle(for: Self.self))
        let useCase = DefaultFetchTransactionListUseCase(repository: repository)
        let expectation = expectation(description: "File not found error should be returned")

        // When: execute() 실행
        useCase.execute()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    XCTAssertEqual(error, ServiceError.dataLoadError, "Expected dataLoadError")
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
                XCTFail("Fetching should have failed but succeeded instead")
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
}
