//
//  ViewModel.swift
//  ViewState
//
//  Created by João Lucas on 07/08/23.
//

import Foundation
import ViewStateKit

final class ViewModel {
    
    private let viewState = ViewState<DataModel, Error>()
    private let service = Service()
    
    func fetchData(user: String) -> ViewState<DataModel, Error> {
        viewState.fetchSource {
            
            self.service.request(user: user) { result in
                switch result {
                case .success(let model):
                    self.viewState.success(data: model)
                case .failure(let error):
                    self.viewState.error(error: error)
                }
            }
        }
        
        return viewState
    }
}
