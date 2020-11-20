//
//  URL+Utils.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

extension URLRequest {

    init(with url: URL?) {
        guard let url = url else {
            preconditionFailure("Invalid URL")
        }
        self = URLRequest(url: url)
    }
}
