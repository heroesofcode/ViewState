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
    var service: MyGithubService!

    override func setUpWithError() throws {
        client = HTTPClientMock()
        service = MyGithubService(client: client)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVerifyGetMyGithubItemsWithSuccess() throws {
        client.fileName = "my-github"
        
        service.getMyGithub { result in
            switch result {
                case .success(let myGithub):
                    XCTAssertEqual("joaolfp", myGithub.login)
                case .failure(let error):
                    fatalError(error.localizedDescription)
            }
        }
    }

}
