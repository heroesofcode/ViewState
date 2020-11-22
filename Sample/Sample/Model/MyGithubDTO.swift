//
//  MyGithubDTO.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

struct MyGithubDTO: Decodable {
    let login: String
    let name: String
    let company: String
    let bio: String
    let avatar_url: String
}
