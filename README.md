<p align="center">
    <img src="https://github.com/heroesofcode/ViewState/blob/master/assets/logo.png?raw=true">
</p>

[![CI](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml/badge.svg)](https://github.com/heroesofcode/ViewState/actions/workflows/CI.yml)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen)](https://swift.org/package-manager/)
[![License](https://img.shields.io/github/license/joaolfp/ViewState.svg)](https://github.com/joaolfp/ViewState/blob/master/LICENSE)

## Overview

A View State library to return the results for each state

## Support

iOS 15.0+ / macOS 12.0+ / tvOS 15.0+ / watchOS 7.0+ / visionOS 1+

## Usage

In ViewModel calls the states that will return to ViewController

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
In the ViewController it calls the ViewModel method and places the states of each one.

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

loadingObserver is optional, you can just use success and error

``` swift
private func loadData() {
     viewModel.fetchData()
         .successObserver(onSuccess)
         .errorObserver(onFailure)
}
```

See a demo below. You can see this demo in our [example](https://github.com/heroesofcode/ViewState/tree/master/Example) :smiley:.<br>
<img src="https://github.com/heroesofcode/ViewState/blob/master/assets/ImageExample.gif?raw=true" width="310" height="640" />

## Installation

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

```swift
import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
       .package(
           url: "https://github.com/heroesofcode/ViewState", 
           exact: "2.1.0"
        )
    ],
    targets: [
        .target(
            name: "<Your Target Name>",
            dependencies: ["ViewState"]
        ),
    ]
)
```

## License

ViewState is released under the MIT license. See [LICENSE](https://github.com/heroesofcode/ViewState/blob/master/LICENSE) for details.
