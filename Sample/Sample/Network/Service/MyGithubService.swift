//
//  MyGithubService.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

class MyGithubService: MyGithubServiceProtocol {
    
    private let client: HTTPClientProtocol

    init(client: HTTPClientProtocol = HTTPClient()) {
        self.client = client
    }
    
    func getMyGithub(completion: @escaping (Result<MyGithubDTO, HTTPError>) -> Void) {
        let endpoint: Endpoint = .myGithub
        let request = endpoint.request
                
        client.request(request, completion: completion)
    }
}
