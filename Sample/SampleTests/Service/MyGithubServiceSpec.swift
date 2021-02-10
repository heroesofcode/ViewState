//
//  MyGithubServiceSpec.swift
//  SampleTests
//
//  Created by Joao Lucas on 21/11/20.
//

import XCTest
@testable import Sample

class MyGithubServiceSpec: XCTestCase {
    
    var client: HTTPClientMock!
    var sut: MyGithubService!
    
    override func setUp() {
        super.setUp()
        
        client = HTTPClientMock()
        sut = MyGithubService(client: client)
    }

    override func tearDown() {
        client = nil
        sut = nil
    }

    func testVerifyGetMyGithubItemsWithSuccess() {
        client.fileName = "my-github"
        
        sut.getMyGithub { result in
            switch result {
                case .success(let myGithub):
                    XCTAssertEqual("joaolfp", myGithub.login)
                case .failure(let error):
                    fatalError(error.localizedDescription)
            }
        }
    }

}
