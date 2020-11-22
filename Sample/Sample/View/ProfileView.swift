//
//  ProfileView.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

class ProfileView: UIView {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let photo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.layer.cornerRadius = 90/2
        image.layer.borderWidth = 4
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        return image
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "João Lucas"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.accessibilityIdentifier = "name-text"
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "joaolfp"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.accessibilityIdentifier = "username-text"
        return label
    }()
    
    let bio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let iconCompany: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.Images.company)
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return image
    }()
    
    let company: UILabel = {
        let label = UILabel()
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
        container.topAnchor.constraint(equalTo: topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        photo.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        photo.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 90).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        name.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 16).isActive = true
        name.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        username.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        username.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        bio.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 16).isActive = true
        bio.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        stackViewCompany.topAnchor.constraint(equalTo: bio.bottomAnchor, constant: 16).isActive = true
        stackViewCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
