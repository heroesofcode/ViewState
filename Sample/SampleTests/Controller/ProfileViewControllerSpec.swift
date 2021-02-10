//
//  ProfileViewControllerSpec.swift
//  SampleTests
//
//  Created by Joao Lucas on 22/11/20.
//

import XCTest
@testable import Sample

class ProfileViewControllerSpec: XCTestCase {
    
    var sut: ProfileViewController!

    override func setUp() {
        super.setUp()
        
        sut = ProfileViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }

    func testShouldBeAbleToCreateAController() throws {
        XCTAssertNotNil(sut)
    }
    
    func testShouldHaveAViewOfType() throws {
        XCTAssertNotNil(sut.profileView)
    }
}
