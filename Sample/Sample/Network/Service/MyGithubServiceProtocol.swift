//
//  MyGithubServiceProtocol.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

protocol MyGithubServiceProtocol {
    func getMyGithub(completion: @escaping (Result<MyGithubDTO, HTTPError>) -> Void)
}
