<p align="center">
    <img src="https://github.com/joaolfp/ViewState/blob/master/logo/logo.png">
</p>

[![Swift Version](https://img.shields.io/badge/Swift-5.0.x-orange.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/joaolfp/ViewState/blob/master/LICENSE)

View State of API results using Alamofire and SwiftyJSON

## How to use?

- In ViewModel calls the states that will return to ViewController

```swift
func fetchMovie() -> ViewState<[Movie]> {
    self.viewState.fetchSource {
        self.service.getApiMovie(
            onSuccess: { (resultArray) in
                self.movieArray = MovieMapper(resultArray: resultArray).transform()
                self.viewState.success(data: self.movieArray)
        },
            onError: { (messageError) in
                self.viewState.error(error: messageError)
        })
    }

    return viewState
}
```
- In the ViewController it calls the ViewModel method and places the states of each one.

``` swift
private func setupFetchMovie() {
     viewModel.fetchMovie()
         .successObserver(onSuccess)
         .loadingObserver(onLoading)
         .errorObserver(onError)
}
```

## Sample Project

[Movie application using MVVM and ViewState architecture](https://github.com/joaolfp/TMDB)

Coded by João Lucas

## License
Licensed under the [MIT License](LICENSE).
