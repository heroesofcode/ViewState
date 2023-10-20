import Foundation

class Observable<T> {

    typealias CompletionHandler = ((T) -> Void)

    var value: T? {
        didSet {
            self.notifyObservers(self.observers)
        }
    }

    var observers: [Int: CompletionHandler] = [:]

    init(value: T?) {
        self.value = value
    }

    func addObserver(_ observer: ObserverProtocol, completion: @escaping CompletionHandler) {
        self.observers[observer.id] = completion
    }

    func removeObserver(_ observer: ObserverProtocol) {
        self.observers.removeValue(forKey: observer.id)
    }

    func notifyObservers(_ observers: [Int: CompletionHandler]) {
        if value != nil {
            guard let value = value else { return }
            observers.forEach({ $0.value(value) })
        }
    }

    deinit {
        observers.removeAll()
    }
}
