//
//  LoadingStateView.swift
//  Sample
//
//  Created by Joao Lucas on 21/11/20.
//

import UIKit

class LoadingStateView: UIView {
    
    private let backgroundLoading: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.Images.loading)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingStateView: ViewCode {
    func buildViewHierarchy() {
        addSubview(backgroundLoading)
    }
    
    func setupConstraints() {
        backgroundLoading.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundLoading.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundLoading.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundLoading.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
