//
//  ItunesRepositoriesTests.swift
//  itunesTests
//
//  Created by Jefferson Miralles on 12/4/21.
//

import XCTest
@testable import itunes

class ItunesRepositoriesTests: XCTestCase {

    var sut: ItunesRepositories!
    var mockItunesAPIService: MockItunesAPIService!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockItunesAPIService = MockItunesAPIService()
        sut = ItunesRepositories(apiService: mockItunesAPIService)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_NotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testSearchTerm_CompletionHandler_ShouldHaveResultWithSuccess() {
        sut.searchTerm(query: "test") { apiResponse in
            switch apiResponse.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testSearchTerm_CompletionHandler_ShouldHaveResultWithItems() {
        sut.searchTerm(query: "test") { apiResponse in
            switch apiResponse.result {
            case .success(let items):
                XCTAssertNotNil(items, "items should not be nil.")
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testSearchTerm_CompletionHandler_Items_Results_ShouldNotBeEmpty() {
        sut.searchTerm(query: "test") { apiResponse in
            switch apiResponse.result {
            case .success(let items):
                XCTAssertGreaterThan(items.results.count, 0)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testSearchTerm_CompletionHandler_ShouldHaveResultWithError() {
        mockItunesAPIService.shouldReturnError = true
        sut.searchTerm(query: "test") { apiResponse in
            switch apiResponse.result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error, "Error should not be nil.")
            }
        }
    }

}
