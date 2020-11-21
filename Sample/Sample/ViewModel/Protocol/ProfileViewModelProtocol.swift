//
//  ProfileViewModelProtocol.swift
//  Sample
//
//  Created by Joao Lucas on 21/11/20.
//

import ViewStateKit

protocol ProfileViewModelProtocol {
    func fetchMyProfile() -> ViewState<MyGithubDTO, HTTPError>
}
