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

    private let stateQueue = DispatchQueue(label: "viewState.queue", attributes: .concurrent)

    public init() {
        observerRequest()
    }

    @discardableResult
    public func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        successBehavior.addObserver(self) { [weak self] data in
            guard let data else { return }
            DispatchQueue.main.async {
                success(data)
            }
        }
        successObserved = true
        verifyMakeRequest()
        return self
    }

    @discardableResult
    public func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        loadingBehavior.addObserver(self) { [weak self] _ in
            DispatchQueue.main.async {
                loading()
            }
        }
        loadingObserved = true
        verifyMakeRequest()
        return self
    }

    @discardableResult
    public func errorObserver(_ error: @escaping (E) -> Void) -> ViewState {
        errorBehavior.addObserver(self) { [weak self] errorMessage in
            guard let errorMessage else { return }
            DispatchQueue.main.async {
                error(errorMessage)
            }
        }
        errorObserved = true
        verifyMakeRequest()
        return self
    }

    public func fetchSource(_ request: @escaping () -> Void) {
        fetchSourceBehavior = request
    }

    private func postRequest() {
        stateQueue.async(flags: .barrier) {
            self.verifyCanMakeRequest.value = Any.self
        }
    }

    private func observerRequest() {
        verifyCanMakeRequest.addObserver(self) { [weak self] _ in
            guard let self else { return }

            self.loading()
            self.fetchSourceBehavior()
        }
    }

    private func loading() {
        stateQueue.async(flags: .barrier) {
            self.loadingBehavior.value = {}
        }
    }

    public func success(data: T) {
        stateQueue.async(flags: .barrier) {
            self.clearErrors()
            self.successBehavior.value = data
        }
    }

    public func error(error: E) {
        stateQueue.async(flags: .barrier) {
            self.clearSuccess()
            self.errorBehavior.value = error
        }
    }

    func onValueChanged(_ value: Any?) {}

    private func verifyMakeRequest() {
        if successObserved, loadingObserved, errorObserved {
            postRequest()
        } else if successObserved, errorObserved {
            postRequest()
        }
    }

    private func clearSuccess() {
        successBehavior.value = nil
    }

    private func clearErrors() {
        errorBehavior.value = nil
    }
}
