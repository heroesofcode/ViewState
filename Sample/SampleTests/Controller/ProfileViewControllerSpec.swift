//
//  ProfileViewControllerSpec.swift
//  SampleTests
//
//  Created by Joao Lucas on 22/11/20.
//

import XCTest
@testable import Sample

class ProfileViewControllerSpec: XCTestCase {
    
    var controller: ProfileViewController!

    override func setUpWithError() throws {
        controller = ProfileViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldBeAbleToCreateAController() throws {
        XCTAssertNotNil(controller)
    }
    
    func testShouldHaveAViewOfType() throws {
        XCTAssertNotNil(controller.profileView)
    }
}
