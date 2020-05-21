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

## Sample Project

[Movie application using MVVM and ViewState architecture](https://github.com/joaolfp/TMDB)

Coded by João Lucas

MIT License

Copyright (c) 2020 João Lucas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
