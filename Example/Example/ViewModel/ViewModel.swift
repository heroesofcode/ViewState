//
//  ViewModel.swift
//  ViewState
//
//  Created by João Lucas on 07/08/23.
//

import Foundation
import ViewState

final class ViewModel {

    private let viewState = ViewState<DataModel, Error>()
    private let service = Service()

    func fetchData(user: String) -> ViewState<DataModel, Error> {
        viewState.fetchSource {
            self.service.request(user: user) { [weak self] result in
                switch result {
                case let .success(model):
                    self?.viewState.success(data: model)
                case let .failure(error):
                    self?.viewState.error(error: error)
                }
            }
        }

        return viewState
    }
}
