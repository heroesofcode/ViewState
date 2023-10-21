<p align="center">
    <img src="https://github.com/heroesofcode/ViewState/blob/master/.github/assets/logo.png">
</p>

[![CI](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml/badge.svg)](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen)](https://swift.org/package-manager/)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fheroesofcode%2FViewState%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/heroesofcode/ViewState)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fheroesofcode%2FViewState%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/heroesofcode/ViewState)
[![License](https://img.shields.io/github/license/joaolfp/ViewState.svg)](https://github.com/joaolfp/ViewState/blob/master/LICENSE)

## Overview

A View State library to return the results for each state

## Usage

- In ViewModel calls the states that will return to ViewController

```swift
import ViewState

final class ViewModel {
    
    private var viewState = ViewState<Model, APIError>()
    private let service = Service()
    
    func fetchData() -> ViewState<Model, APIError> {
        viewState.fetchSource {
            self.service.getData { [weak self] result in
                switch result {
                case .success(let response):
                    self?.viewState.success(data: response)
                case .failure(let error):
                    self?.viewState.error(error: error)
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

        loadData()
    }
    
    private func loadData() {
        viewModel.fetchData()
            .loadingObserver(onLoading)
            .successObserver(onSuccess)
            .errorObserver(onFailure)
    }
    
    private func onLoading() {
        // Event loading
    }
    
    private func onSuccess(response: Model) {
        // Event success
    }
    
    private func onFailure(error: APIError) {
        // Event error
    }
}
```

- See a demo below. You can see this demo in our [example](https://github.com/heroesofcode/ViewState/tree/master/Example) :smiley:.
<img src="https://github.com/heroesofcode/ViewState/blob/master/.github/assets/ImageExample.gif" width="310" height="640" />

## Installation

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

```swift
import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
       .package(url: "https://github.com/heroesofcode/ViewState", .upToNextMajor(from: "1.5.0"))
    ],
    targets: [
        .target(
            name: "<Your Target Name>",
            dependencies: ["ViewState"]),
    ]
)
```

## Contributing

To contribute, just fork this project and then open a pull request, feel free to contribute, bring ideas and raise any problem in the issue tab.

## License

ViewState is released under the MIT license. See LICENSE for details.
