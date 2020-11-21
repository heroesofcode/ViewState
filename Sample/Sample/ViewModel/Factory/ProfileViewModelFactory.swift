//
//  ProfileViewModelFactory.swift
//  Sample
//
//  Created by Joao Lucas on 21/11/20.
//

import ViewStateKit

class ProfileViewModelFactory {
    
    func create() -> ProfileViewModel {
        return ProfileViewModel(
            service: MyGithubService(),
            viewState: ViewState<MyGithubDTO, HTTPError>()
        )
    }
}
