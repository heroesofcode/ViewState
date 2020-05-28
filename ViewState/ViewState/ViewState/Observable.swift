//
//  Observable.swift
//  ViewState
//
//  Created by Joao Lucas on 28/05/20.
//  Copyright © 2020 Joao Lucas. All rights reserved.
//

import Foundation

class Observable<T> {

    typealias CompletionHandler = ((T) -> Void)

    var value : T? {
        didSet {
            self.notifyObservers(self.observers)
        }
    }

    var observers : [Int : CompletionHandler] = [:]

    init(value: T?) {
        self.value = value
    }

    func addObserver(_ observer: ObserverProtocol, completion: @escaping CompletionHandler) {
        self.observers[observer.id] = completion
    }

    func removeObserver(_ observer: ObserverProtocol) {
        self.observers.removeValue(forKey: observer.id)
    }

    func notifyObservers(_ observers: [Int : CompletionHandler]) {
        if value != nil {
            observers.forEach({ $0.value(value!) })
        }
    }

    deinit {
        observers.removeAll()
    }
}
