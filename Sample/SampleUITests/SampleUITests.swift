//
//  SampleUITests.swift
//  SampleUITests
//
//  Created by Joao Lucas on 20/11/20.
//

import XCTest

class SampleUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testExample() throws {
        let nameText = app.staticTexts["name-text"].label
        let usernameText = app.staticTexts["username-text"].label
        
        XCTAssertEqual("João Lucas", nameText)
        XCTAssertEqual("joaolfp", usernameText)
        
    }
}
