//
//  ViewState.swift
//  ViewState
//
//  Created by Joao Lucas on 21/05/20.
//  Copyright © 2020 Joao Lucas. All rights reserved.
//

import Foundation
import Alamofire

class ViewState<T> : ObserverProtocol{
    
    var id: Int = 123
    
    private var successBehavior: Observable<T> = Observable(value: nil)
    
    private var loadingBehavior: Observable<() -> Void> = Observable(value: nil)
    
    private var errorBehavior: Observable<(AFError?)> = Observable(value: nil)

    private var successObserved = false
    private var loadingObserved = false
    private var errorObserved = false
    
    private var verifyCanMakeRequest: Observable<Any> = Observable(value: nil)
    
    private var fetchSourceBehavior: () -> Void = {}
    
    init() {
        observerRequest()
    }
    
    @discardableResult
    func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        
        self.successBehavior.addObserver(self) { data in
            success(data)
        }
        
        self.successObserved = true
        self.verifyMakeRequest()
                
        return self
    }
    
    @discardableResult
    func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        self.loadingBehavior.addObserver(self) { _ in
            loading()
        }
        
        self.loadingObserved = true
        self.verifyMakeRequest()
        
        return self
    }
    
    @discardableResult
    func errorObserver(_ error: @escaping (AFError?) -> Void) -> ViewState {
        self.errorBehavior.addObserver(self) { aferror in
            error(aferror)
        }
        
        self.errorObserved = true
        self.verifyMakeRequest()
        
        return self
    }
    
    func fetchSource(_ request: @escaping () -> Void) {
        self.fetchSourceBehavior = request
    }
    
    private func postRequest() {
        self.verifyCanMakeRequest.value = (Any).self
    }
    
    private func observerRequest() {
        self.verifyCanMakeRequest.addObserver(self) { _ in
            self.loading()
            self.fetchSourceBehavior()
        }
    }
    
    func success(data: T) {
        self.successBehavior.value = data
    }
    
    func loading() {
        self.loadingBehavior.value = {}
    }
    
    func error(error: AFError?) {
        self.errorBehavior.value = error
    }
    
    func onValueChanged(_ value: Any?) {
        //empty
    }
    
    func verifyMakeRequest() {
        if successObserved &&
            loadingObserved &&
            errorObserved {
            
            postRequest()
        }
    }
}
