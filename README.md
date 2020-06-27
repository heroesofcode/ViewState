<p align="center">
    <img src="https://github.com/joaolfp/ViewState/blob/master/logo/logo.png">
</p>

[![Swift Version](https://img.shields.io/badge/Swift-5.0.x-orange.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/joaolfp/ViewState/blob/master/LICENSE)

## Overview

A View State library to return the results for each state

## How to use?

- In ViewModel calls the states that will return to ViewController

```swift
func fetchMovie() -> ViewState<[Movie], AFError?> {
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
    
private func onSuccess(movie: [Movie]) {
      self.collection.reloadData()
      alert.dismiss(animated: true, completion: nil)
}
    
private func onLoading() {
      let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
      loadingIndicator.hidesWhenStopped = true
      loadingIndicator.style = UIActivityIndicatorView.Style.medium
      loadingIndicator.startAnimating();
        
      alert.view.addSubview(loadingIndicator)
      present(alert, animated: true, completion: nil)
}
    
private func onError(message: AFError?) {
      ErrorView.instance.showError()
}
```

## Author
Coded by João Lucas

## License
Licensed under the [MIT License](LICENSE).
