<p align="center">
    <img src="https://github.com/heroesofcode/ViewState/blob/master/.github/assets/logo.png">
</p>

[![CI](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml/badge.svg)](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml)
[![Swift Version](https://img.shields.io/badge/Swift-5.0.x-orange.svg)]()
[![Tag](https://img.shields.io/github/v/tag/heroesofcode/ViewState?logo=github)](https://github.com/heroesofcode/ViewState/releases)
[![Cocoapods compatible](https://img.shields.io/cocoapods/v/ViewStateKit)](https://cocoapods.org/pods/ViewStateKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen)](https://swift.org/package-manager/)
[![License](https://img.shields.io/github/license/joaolfp/ViewState.svg)](https://github.com/joaolfp/ViewState/blob/master/LICENSE)

## Overview

A View State library to return the results for each state

## Support
iOS / tvOS / macOS

## Usage

- In ViewModel calls the states that will return to ViewController

```swift
func fetchMovie() -> ViewState<Movie, AFError> {
        self.viewState.fetchSource {
            self.service.getApiMovie(
                onSuccess: { resultArray in
                    self.viewState.success(data: movieArray)
            },
                onError: { messageError in
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

``` swift
private func onSuccess(movie: Movie) {
      collectionView.reloadData()
      activityIndicator.stopAnimating()
}
    
private func onLoading() {
     activityIndicator.startAnimating()
}
    
private func onError(message: AFError?) {
      ErrorView.instance.showError()
}
```

## Installation

<details>
  <summary><strong>Swift Package Manager</strong></summary>
    
```swift
import ViewState
```

```swift
dependencies: [
    .package(url: "https://github.com/joaolfp/ViewState.git", .upToNextMajor(from: "1.3.2"))
]
```

</details>

<details>
  <summary><strong>CocoaPods</strong></summary>

```swift
import ViewStateKit
```

```ruby
target '<Your Target Name>' do
  pod 'ViewStateKit'
end
```

```bash
$ pod install
```
    
</details>
    
<details>
  <summary><strong>Carthage</strong></summary>
    
```bash
github "heroesofcode/ViewState"
```
</details>
    
## Author
Coded by [João Lucas](https://github.com/joaolfp)

## License

```
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
© 2020 GitHub, Inc.
```
