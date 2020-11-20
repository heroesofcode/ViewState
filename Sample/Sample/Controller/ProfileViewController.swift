//
//  ProfileViewController.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        MyGithubService().getMyGithub { [weak self] result in
            switch result {
            case.success(let myGithub):
                print(myGithub.name)
                print(myGithub.login)
            case .failure(let error):
                print(error)
            }
        }
    }
}
