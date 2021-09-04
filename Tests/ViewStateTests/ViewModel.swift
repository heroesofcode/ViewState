import Foundation
@testable import ViewState

final class ViewModel {
    
    private var viewState: ViewState<String, String>
    
    init(viewState: ViewState<String, String>) {
        self.viewState = viewState
    }
    
    func fetchDatas() -> ViewState<String, String> {
        viewState.fetchSource {
            self.viewState.success(data: "Lucas")
            self.viewState.error(error: "Error")
        }
        
        return viewState
    }
}
