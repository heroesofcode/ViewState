//
//  ProfileStateMock.swift
//  SampleTests
//
//  Created by Joao Lucas on 21/11/20.
//

import Foundation
@testable import Sample

class ProfileStateMock {
    
    var success = false
    var loading = false
    var failure = false
    
    func onSuccess(myGithub: MyGithubDTO) {
        success = true
    }
    
    func onLoading() {
        loading = false
    }
    
    func onError(error: HTTPError) {
        failure = false
    }
    
}
