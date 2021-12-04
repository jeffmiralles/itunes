//
//  MainViewModelTests.swift
//  itunesTests
//
//  Created by Jefferson Miralles on 12/4/21.
//

import XCTest
@testable import itunes

class MainViewModelTests: XCTestCase {
    var sut: MainViewModel!
    var mockItunesRepositories: ItunesRepositoriesProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockItunesRepositories = MockItunesRepositories()
        sut = MainViewModel(repository: mockItunesRepositories)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_Items_ResultCount_IsZero_And_Results_IsEmpty() {
        XCTAssertEqual(sut.items.resultCount, 0, "The default value should be 0.")
        XCTAssertTrue(sut.items.results.isEmpty, "Results should be an empty array.")
    }
    
    func testInit_Items_HasData() {
        let exp = expectation(description: "Items must have some data")
        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(self.sut.items.resultCount, 50)
            XCTAssertTrue(!self.sut.items.results.isEmpty)
        }
    }
    
}
