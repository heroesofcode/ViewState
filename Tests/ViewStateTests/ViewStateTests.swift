import XCTest
@testable import ViewState

final class ViewStateTests: XCTestCase {
    
    var viewStateSpy: ViewStateSpy!
    var viewModel: ViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewStateSpy = ViewStateSpy()
        viewModel = ViewModel(viewState: viewStateSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewStateSpy = nil
        viewModel = nil
    }
    
    func testVerifyObserverNameWithSuccess() {
        let myName = Observable<String>(value: "João")
        XCTAssertEqual(myName.value, "João")
    }
    
    func testVerifyFetchDatasWithSuccess() {
        viewModel.fetchDatas()
            .loadingObserver(viewStateSpy.onLoading)
            .successObserver(viewStateSpy.onSuccess)
            .errorObserver(viewStateSpy.onError)
        
        XCTAssertTrue(viewStateSpy.isSuccess)
    }
    
    func testVerifyFetchDatasWithFailure() {
        viewModel.fetchDatas()
            .loadingObserver(viewStateSpy.onLoading)
            .successObserver(viewStateSpy.onSuccess)
            .errorObserver(viewStateSpy.onError)
        
        XCTAssertTrue(viewStateSpy.isFailure)
    }
    
    func testVerifyOnLoading() {
        viewModel.fetchDatas()
            .loadingObserver(viewStateSpy.onLoading)
            .successObserver(viewStateSpy.onSuccess)
            .errorObserver(viewStateSpy.onError)
        
        XCTAssertTrue(viewStateSpy.isLoading)
    }

    static var allTests = [
        ("testVerifyObserverNameWithSuccess", testVerifyObserverNameWithSuccess),
        ("testVerifyFetchDatasWithSuccess", testVerifyFetchDatasWithSuccess),
        ("testVerifyFetchDatasWithFailure", testVerifyFetchDatasWithFailure),
        ("testVerifyOnLoading", testVerifyOnLoading)
    ]
}
