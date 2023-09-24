//
//  ViewController.swift
//  Example
//
//  Created by João Lucas on 07/08/23.
//

import UIKit
import ViewState

final class ViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.placeholder = "User Github"
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(searchTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .gray
        return view
    }()
    
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(nameLabel)
        view.addSubview(searchButton)
        view.addSubview(activityIndicator)
        
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.backgroundColor = .white
    }
    
    @objc
    func searchTap() {
        guard let text = textField.text else { return }
        fetchData(user: text)
    }
    
    private func fetchData(user: String) {
        viewModel.fetchData(user: user)
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    private func onLoading() {
        activityIndicator.startAnimating()
    }
    
    private func onSuccess(data: DataModel) {
        nameLabel.text = data.name
        nameLabel.textColor = .black
        activityIndicator.stopAnimating()
    }
    
    private func onFailure(error: Error) {
        nameLabel.text = "User not found"
        nameLabel.textColor = .red
        activityIndicator.stopAnimating()
    }
}
