//
//  ItemsStructTests.swift
//  itunesTests
//
//  Created by Jefferson Miralles on 12/2/21.
//

import XCTest
@testable import itunes

class ItemsStructTests: XCTestCase {
    
    override func setUp(){
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_NotNil() {
        let items = Items(resultCount: 0, results: [])
        XCTAssertNotNil(items)
    }

}
