//
//  ProfileViewController.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
