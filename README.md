# ViewState

View State of API results using Alamofire and JSON

## How to use?

- Create a ViewState class and add this code just below

```swift
import Foundation
import Alamofire

class ViewState<T> {
    private var successBehavior: (T) -> Void = { _ in }
    
    private var loadingBehavior: () -> Void = { }
    
    private var errorBehavior: ((_ error: AFError?) -> Void) = { _ in }

    @discardableResult
    func successObserver(_ success: @escaping (T) -> Void) -> ViewState {
        self.successBehavior = success
        
        return self
    }
    
    @discardableResult
    func loadingObserver(_ loading: @escaping () -> Void) -> ViewState {
        self.loadingBehavior = loading
        
        return self
    }
    
    @discardableResult
    func errorObserver(_ error: @escaping (AFError?) -> Void) -> ViewState {
        self.errorBehavior = error
        
        return self
    }
    
    func success(data: T) {
        successBehavior(data)
    }
    
    func loading() {
        loadingBehavior()
    }
    
    func error(error: AFError?) {
        errorBehavior(error)
    }
}
```
- In ViewModel calls the states that will return to ViewController

```swift
func fetchMovie() -> ViewState<[Movie]> {
        self.viewState.loading()
        
        service.getApiInventory(
            onSuccess: { (resultArray) in
                self.movieArray = MovieMapper(resultArray: resultArray).transform()
                self.viewState.success(data: self.movieArray)
        },
            onError: { (messageError) in
                self.viewState.error(error: messageError)
        })
        
        return viewState
}
```

## Sample Project

[Movie application using MVVM and ViewState architecture](https://github.com/joaolfp/TMDB)

Coded by João Lucas

## License
Licensed under the [MIT License](LICENSE).
