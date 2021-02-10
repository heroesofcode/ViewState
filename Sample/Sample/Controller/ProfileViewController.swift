//
//  ProfileViewController.swift
//  Sample
//
//  Created by Joao Lucas on 20/11/20.
//

import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    var viewModel: ProfileViewModelProtocol!
    
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
        let url = URL(string: myGithub.avatar_url)
        profileView.photo.kf.setImage(with: url)
        
        profileView.name.text = myGithub.name
        profileView.username.text = myGithub.login
        profileView.bio.text = myGithub.bio
        profileView.company.text = myGithub.company
        
        self.view = profileView
    }
    
    private func onLoading() {
        let loadingView = LoadingStateView()
        self.view = loadingView
    }
    
    private func onError(error: HTTPError) {
        print("Vish, \(error.localizedDescription)")
    }
}
