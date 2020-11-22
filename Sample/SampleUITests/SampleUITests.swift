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
        continueAfterFailure = false
    }

    func testVerifyMyDatas() throws {
        let nameText = app.staticTexts["name-text"].label
        let usernameText = app.staticTexts["username-text"].label
        
        XCTAssertEqual("João Lucas", nameText)
        XCTAssertEqual("joaolfp", usernameText)
        
    }
}
