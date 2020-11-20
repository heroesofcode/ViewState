//
//  ProfileView.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

class ProfileView: UIView {
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileView: ViewCode {
    func buildViewHierarchy() {
        addSubview(container)
    }
    
    func setupConstraints() {
        container.topAnchor.constraint(equalTo: topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
