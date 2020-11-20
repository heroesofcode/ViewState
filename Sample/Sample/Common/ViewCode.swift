//
//  ViewCode.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCode {

    func setupBaseView() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() {
    }
}
