import Foundation

public class ViewState<T, E>: ObserverProtocol {
    
    var id: Int = 123
    
    private var successBehavior: Observable<T> = Observable(value: nil)
    
    private var loadingBehavior: Observable<() -> Void> = Observable(value: nil)
    
    private var errorBehavior: Observable<(E)> = Observable(value: nil)

    private var successObserved = false
    private var loadingObserved = false
    private var errorObserved = false
    
    private var verifyCanMakeRequest: Observable<Any> = Observable(value: nil)
    
    private var fetchSourceBehavior: () -> Void = {}
    
    public init() {
        observerRequest()
    }
    
    @discardableResult
    public func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        
        self.successBehavior.addObserver(self) { data in
            success(data)
        }
        
        self.successObserved = true
        self.verifyMakeRequest()
                
        return self
    }
    
    @discardableResult
    public func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        self.loadingBehavior.addObserver(self) { _ in
            loading()
        }
        
        self.loadingObserved = true
        self.verifyMakeRequest()
        
        return self
    }
    
    @discardableResult
    public func errorObserver(_ error: @escaping (E) -> Void) -> ViewState {
        self.errorBehavior.addObserver(self) { errorMessage in
            error(errorMessage)
        }
        
        self.errorObserved = true
        self.verifyMakeRequest()
        
        return self
    }
    
    public func fetchSource(_ request: @escaping () -> Void) {
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
    
    private func loading() {
        self.loadingBehavior.value = {}
    }
    
    public func success(data: T) {
        self.successBehavior.value = data
    }
    
    public func error(error: E) {
        self.errorBehavior.value = error
    }
    
    func onValueChanged(_ value: Any?) {}
    
    private func verifyMakeRequest() {
        if successObserved &&
            loadingObserved &&
            errorObserved {
            
            postRequest()
        }
    }
}
