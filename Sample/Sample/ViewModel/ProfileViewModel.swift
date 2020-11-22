//
//  ProfileViewModel.swift
//  Sample
//
//  Created by Joao Lucas on 21/11/20.
//

import ViewStateKit

class ProfileViewModel: ProfileViewModelProtocol {
    
    let service: MyGithubServiceProtocol
    var viewState: ViewState<MyGithubDTO, HTTPError>
    
    init(service: MyGithubServiceProtocol, viewState: ViewState<MyGithubDTO, HTTPError>) {
        self.service = service
        self.viewState = viewState
    }
    
    func fetchMyProfile() -> ViewState<MyGithubDTO, HTTPError> {
        service.getMyGithub { [weak self] result in
            switch result {
                case.success(let myGithub):
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self?.viewState.success(data: myGithub)
                    }
                case .failure(let error):
                    self?.viewState.error(error: error)
            }
        }
        
        return viewState
    }
    
}
