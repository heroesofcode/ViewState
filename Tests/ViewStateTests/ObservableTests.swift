import XCTest
@testable import ViewState

final class ObservableTests: XCTestCase {

    func testObservableNotifiesObserverOnValueChange() {
        let observable = Observable<Int>(value: nil)
        var observedValue: Int?

        let observer = TestObserver()

        observable.addObserver(observer) { value in
            observedValue = value
        }

        observable.value = 42

        XCTAssertEqual(observedValue, 42)
    }

    func testObservableRemovesObserver() {
        let observable = Observable<Int>(value: nil)
        var observedValue: Int?

        let observer = TestObserver()

        observable.addObserver(observer) { value in
            observedValue = value
        }

        observable.removeObserver(observer)

        observable.value = 100

        XCTAssertNil(observedValue)
    }

    func testObservableNotifiesMultipleObservers() {
        let observable = Observable<String>(value: nil)
        var firstObservedValue: String?
        var secondObservedValue: String?

        let firstObserver = TestObserver()
        let secondObserver = TestObserver()

        observable.addObserver(firstObserver) { value in
            firstObservedValue = value
        }

        observable.addObserver(secondObserver) { value in
            secondObservedValue = value
        }

        observable.value = "João"

        XCTAssertEqual(firstObservedValue, "João")
        XCTAssertEqual(secondObservedValue, "João")
    }
}

final class TestObserver: ObserverProtocol {
    var id: Int = Int.random(in: 0...1000)

    func onValueChanged(_ value: Any?) {}
}
