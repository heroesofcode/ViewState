//
//  ViewState.swift
//  ViewState
//
//  Created by Joao Lucas on 21/05/20.
//  Copyright © 2020 Joao Lucas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ViewState<T> {
    private var successBehavior: (T) -> Void = { _ in }
    
    private var loadingBehavior: () -> Void = { }
    
    private var errorBehavior: ((_ error: AFError?) -> Void) = { _ in }

    @discardableResult
    func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        self.successBehavior = success
        
        return self
    }
    
    @discardableResult
    func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        self.loadingBehavior = loading
        
        return self
    }
    
    @discardableResult
    func errorObserver(_ error: @escaping (AFError?) -> Void) -> ViewState {
        self.errorBehavior = error
        
        return self
    }
    
    func success(data: T) {
        successBehavior(data)
    }
    
    func loading() {
        loadingBehavior()
    }
    
    func error(error: AFError?) {
        errorBehavior(error)
    }
}
