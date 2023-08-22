//
//  APIClient.swift
//  ViewState
//
//  Created by João Lucas on 07/08/23.
//

import Foundation

final class Service {
    
    func request(user: String, completion: @escaping (Result<DataModel, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/users/\(user)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    let response = try JSONDecoder().decode(DataModel.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}

struct DataModel: Codable {
    let name: String
}
