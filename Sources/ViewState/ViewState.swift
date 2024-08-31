import Foundation

public class ViewState<T, E>: ObserverProtocol {

    var id: Int = 123

    private var successBehavior: Observable<T?> = Observable(value: nil)
    private var loadingBehavior: Observable<() -> Void> = Observable(value: nil)
    private var errorBehavior: Observable<E?> = Observable(value: nil)

    private var successObserved = false
    private var loadingObserved = false
    private var errorObserved = false

    private var verifyCanMakeRequest: Observable<Any?> = Observable(value: nil)

    private var fetchSourceBehavior: () -> Void = {}

    public init() {
        observerRequest()
    }

    @discardableResult
    public func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        successBehavior.addObserver(self) { data in
            guard let data else { return }
            success(data)
        }
        successObserved = true
        verifyMakeRequest()
        return self
    }

    @discardableResult
    public func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        loadingBehavior.addObserver(self) { _ in
            loading()
        }
        loadingObserved = true
        verifyMakeRequest()
        return self
    }

    @discardableResult
    public func errorObserver(_ error: @escaping (E) -> Void) -> ViewState {
        errorBehavior.addObserver(self) { errorMessage in
            guard let errorMessage else { return }
            error(errorMessage)
        }
        errorObserved = true
        verifyMakeRequest()
        return self
    }

    public func fetchSource(_ request: @escaping () -> Void) {
        fetchSourceBehavior = request
    }

    private func postRequest() {
        verifyCanMakeRequest.value = Any.self
    }

    private func observerRequest() {
        verifyCanMakeRequest.addObserver(self) { [weak self] _ in
            guard let self else { return }

            loading()
            fetchSourceBehavior()
        }
    }

    private func loading() {
        loadingBehavior.value = {}
    }

    public func success(data: T) {
        successBehavior.value = data
    }

    public func error(error: E) {
        errorBehavior.value = error
    }

    func onValueChanged(_ value: Any?) {}

    private func verifyMakeRequest() {
        if successObserved, loadingObserved, errorObserved {
            postRequest()
        } else if successObserved, errorObserved {
            postRequest()
        }
    }
}
