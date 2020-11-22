//
//  ProfileViewModelSpec.swift
//  SampleTests
//
//  Created by Joao Lucas on 21/11/20.
//

import XCTest
import ViewStateKit
@testable import Sample

class ProfileViewModelSpec: XCTestCase {
    
    var service: MyGithubService!
    var viewModel: ProfileViewModel!
    var stateMock: ProfileStateMock!

    override func setUpWithError() throws {
        service = MyGithubService()
        stateMock = ProfileStateMock()
        viewModel = ProfileViewModel(service: service,
                                     viewState: ViewState<MyGithubDTO, HTTPError>())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVerifyFetchMyGithubDataWithSuccess() throws {
        viewModel.fetchMyProfile()
            .successObserver(stateMock.onSuccess)
            .loadingObserver(stateMock.onLoading)
            .errorObserver(stateMock.onError)
        
        let github = MyGithubDTO(
            login: "joaolfp",
            name: "João Lucas",
            company: "Company",
            bio: "iOS Developer", avatar_url: "myavatar.com")
        
        XCTAssertEqual("João Lucas", github.name)
    }
}
