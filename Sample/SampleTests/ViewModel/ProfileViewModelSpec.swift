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
    var sut: ProfileViewModel!
    var stateMock: ProfileStateMock!
    
    override func setUp() {
        super.setUp()
        
        service = MyGithubService()
        stateMock = ProfileStateMock()
        sut = ProfileViewModel(service: service,
                                     viewState: ViewState<MyGithubDTO, HTTPError>())
    }

    override func tearDown() {
        service = nil
        stateMock = nil
        sut = nil
    }

    func testVerifyFetchMyGithubDataWithSuccess() throws {
        sut.fetchMyProfile()
            .successObserver(stateMock.onSuccess)
            .loadingObserver(stateMock.onLoading)
            .errorObserver(stateMock.onError)
        
        let github = MyGithubDTO.stub(
            login: "joaolfp",
            name: "João Lucas",
            company: "Company",
            bio: "iOS Developer",
            avatar_url: "myavatar.com")
        
        XCTAssertEqual("João Lucas", github.name)
    }
}
