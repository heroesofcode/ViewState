//
//  ProfileView.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

final class ProfileView: UIView {
    
    lazy var container: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var photo: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.layer.cornerRadius = 90/2
        image.layer.borderWidth = 4
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var name: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "João Lucas"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.accessibilityIdentifier = "name-text"
        return label
    }()
    
    lazy var username: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "joaolfp"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.accessibilityIdentifier = "username-text"
        return label
    }()
    
    lazy var bio: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var iconCompany: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.Images.company)
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return image
    }()
    
    lazy var company: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BRQ"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var stackViewCompany: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconCompany, company])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
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
        container.addSubview(photo)
        container.addSubview(name)
        container.addSubview(username)
        addSubview(bio)
        addSubview(stackViewCompany)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 300),
            
            photo.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            photo.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 90),
            photo.heightAnchor.constraint(equalToConstant: 90),
            
            name.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            username.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            bio.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 16),
            bio.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackViewCompany.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 16),
            stackViewCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
