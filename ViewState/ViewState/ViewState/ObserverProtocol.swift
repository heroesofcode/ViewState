//
//  ObserverProtocol.swift
//  ViewState
//
//  Created by Joao Lucas on 28/05/20.
//  Copyright © 2020 Joao Lucas. All rights reserved.
//

import Foundation

protocol ObserverProtocol {

    var id : Int { get set }
    func onValueChanged(_ value: Any?)
}

protocol ObservableProtocol : class {
    var observers : [ObserverProtocol] { get set }

    func addObserver(_ observer: ObserverProtocol)
    func removeObserver(_ observer: ObserverProtocol)
    func notifyObservers(_ observers: [ObserverProtocol])
}
