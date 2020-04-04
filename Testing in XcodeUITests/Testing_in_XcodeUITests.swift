//
//  Testing_in_XcodeUITests.swift
//  Testing in XcodeUITests
//
//  Created by Abiú Roldán on 03/04/20.
//  Copyright © 2020 Elshad Karimov. All rights reserved.
//

import XCTest

class Testing_in_XcodeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertFalse(app.buttons["Register"].isEnabled)
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("a@a.com")
        
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("123")
        
        app.textFields["Year of birth"].tap()
        app.textFields["Year of birth"].typeText("1995")
        
        app.switches["switchLabel"].tap()
        
        XCTAssertTrue(app.buttons["Register"].isEnabled)
        
        let errorLabel = app.staticTexts["errorLabel"]
        XCTAssertFalse(errorLabel.exists)

        app.buttons["Register"].tap()
        XCTAssertTrue(errorLabel.exists)
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
