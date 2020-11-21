//
//  ProfileViewController.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    var viewModel: ProfileViewModelProtocol!
    
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
        
        setupFetchMyProfile()
    }
}

extension ProfileViewController {
    
    private func setupFetchMyProfile() {
        viewModel.fetchMyProfile()
            .successObserver(onSuccess)
            .loadingObserver(onLoading)
            .errorObserver(onError)
    }
    
    private func onSuccess(myGithub: MyGithubDTO) {
        profileView.name.text = myGithub.name
        profileView.username.text = myGithub.login
        profileView.bio.text = myGithub.bio
        profileView.company.text = myGithub.company
    }
    
    private func onLoading() {
        print("Loading")
    }
    
    private func onError(error: HTTPError) {
        print("Vish, \(error)")
    }
}
