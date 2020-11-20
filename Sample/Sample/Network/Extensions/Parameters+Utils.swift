//
//  Parameters+Utils.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

extension HTTPParameters {
    var queryItems: [URLQueryItem] {
        return compactMap { URLQueryItem(name: $0, value: $1) }
    }
}
