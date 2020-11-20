//
//  HTTPScheme.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

enum HTTPScheme: String {
    case http
    case https

    func toString() -> String {
        return self.rawValue
    }
}
