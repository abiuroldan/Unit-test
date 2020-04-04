//
//  Testing_in_XcodeTests_2.swift
//  Testing in XcodeTests 2
//
//  Created by Abiú Roldán on 02/04/20.
//  Copyright © 2020 Elshad Karimov. All rights reserved.
//

import XCTest

class Testing_in_XcodeTests_2: XCTestCase {
    
    let newUser = User()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newUser.email = "a@a.com"
        newUser.password = "123"
        newUser.yearOfBirth = "1998"
        newUser.terms = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmail() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertNil(newUser.checkForm())
        
        newUser.email = ""
        XCTAssertNotNil(newUser.checkForm())
        
        newUser.email = "a"
        XCTAssertNotNil(newUser.checkForm())
    }
    
    func testPassword () {
        XCTAssertNil(newUser.checkForm())
        
        newUser.password = ""
        XCTAssertNotNil(newUser.checkForm())
    }
    
    func testAge() {
        XCTAssertNil(newUser.checkForm())
        
        newUser.yearOfBirth = ""
        XCTAssertNotNil(newUser.checkForm())
        
        newUser.yearOfBirth = "2020"
        XCTAssertNotNil(newUser.checkForm())
        
        newUser.yearOfBirth = "1900"
        XCTAssertNotNil(newUser.checkForm())
        
        newUser.yearOfBirth = "ABC"
        XCTAssertNotNil(newUser.checkForm())
    }
    
    func testTerms() {
        XCTAssertNil(newUser.checkForm())
        
        newUser.terms = false
        XCTAssertNotNil(newUser.checkForm())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
