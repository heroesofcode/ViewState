import Foundation

final class Observable<T> {

    internal typealias CompletionHandler = (T) -> Void

    var value: T? {
        didSet {
            notifyObservers(observers)
        }
    }

    private var observers: [Int: CompletionHandler] = [:]

    init(value: T?) {
        self.value = value
    }

    func addObserver(_ observer: ObserverProtocol, completion: @escaping CompletionHandler) {
        observers[observer.id] = completion
        if let value {
            completion(value)
        }
    }

    func removeObserver(_ observer: ObserverProtocol) {
        observers.removeValue(forKey: observer.id)
    }

    func notifyObservers(_ observers: [Int: CompletionHandler]) {
        guard let value else { return }
        observers.forEach { $0.value(value) }
    }

    deinit {
        observers.removeAll()
    }
}
