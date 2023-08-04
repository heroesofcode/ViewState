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
import ViewState

final class ViewModel {
    
    private var viewState = ViewState<[RestaurantsDTO], APIError>()
    private let service = Service()
    
    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError> {
        viewState.fetchSource {
            self.service.getRestaurantsList { result in
                switch result {
                case .success(let restaurants):
                    self.viewState.success(data: restaurants)
                case .failure(let error):
                    self.viewState.error(error: error)
               }
           }
        }

        return viewState
    }
}
```
- In the ViewController it calls the ViewModel method and places the states of each one.

``` swift
import UIKit
import ViewState

final class ViewController: UIViewController {

    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchRestaurantsList()
    }
    
    private func fetchRestaurantsList() {
        viewModel.fetchRestaurants()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    private func onLoading() {
        // Event loading
    }
    
    private func onSuccess(restaurants: [RestaurantsDTO]) {
        // Event success
    }
    
    private func onFailure(error: APIError) {
        // Event error
    }
}
```

## Installation

### [CocoaPods](https://cocoapods.org)

```ruby
target '<Your Target Name>' do
  pod 'ViewStateKit'
end
```

After run
```bash
$ pod install
```

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

```swift
dependencies: [
    .package(url: "https://github.com/joaolfp/ViewState.git", .upToNextMajor(from: "1.3.2"))
]
```

### [Carthage](https://github.com/Carthage/Carthage)

```
github "heroesofcode/ViewState"
```
    
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
