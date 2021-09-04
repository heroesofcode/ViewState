import Foundation
@testable import ViewState

final class ViewStateSpy: ViewState<String, String> {
    
    var isLoading: Bool
    
    var isSuccess: Bool
    
    var isFailure: Bool
    
    override init() {
        isLoading = false
        isSuccess = false
        isFailure = false
    }
    
    override func loadingObserver(_ loading: @escaping () -> Void) -> ViewState<String, String> {
        isLoading = true
        return self
    }
    
    override func successObserver(_ success: @escaping (String) -> Void) -> ViewState<String, String> {
        isSuccess = true
        return self
    }
    
    override func errorObserver(_ error: @escaping (String) -> Void) -> ViewState<String, String> {
        isFailure = true
        return self
    }
    
    func onLoading() {}
    
    func onSuccess(name: String) {}
    
    func onError(error: String) {}
}
