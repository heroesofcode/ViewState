//
//  Endpoint.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

enum Endpoint {
    case myGithub
}

extension Endpoint: EndpointProtocol {
    var scheme: HTTPScheme {
        return .https
    }
    
    var host: String {
        return "api.github.com"
    }
    
    var path: String {
        switch self {
        case .myGithub:
            return "/users/joaolfp"
        }
    }
    
    var parameters: HTTPParameters {
        return ["": ""]
    }
    
    var method: HTTPMethod {
        switch self {
        case .myGithub:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Content-type": "application/json"]
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme.toString()
        components.host = host
        components.path = path
        components.queryItems = parameters.queryItems
        return components
    }

    var request: URLRequest {
        var request = URLRequest(with: urlComponents.url)
        request.httpMethod = method.toString()
        request.allHTTPHeaderFields = headers
        return request
    }
}
