//
//  MyGithubDTOStub.swift
//  SampleTests
//
//  Created by Joao Lucas on 10/02/21.
//

import Foundation
@testable import Sample

extension MyGithubDTO {
    
    static func stub(login: String, name: String, company: String, bio: String, avatar_url: String) -> MyGithubDTO {
        return MyGithubDTO(login: login, name: name, company: company, bio: bio, avatar_url: avatar_url)
    }
    
}
