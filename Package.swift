// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewState",
    platforms: [.iOS(.v12), .macOS(.v10_15), .tvOS(.v12), .watchOS(.v4)],
    products: [
        .library(
            name: "ViewState",
            targets: ["ViewState"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/heroesofcode/DataLife", exact: "2.0.0")
    ],
    targets: [
        .target(
            name: "ViewState",
            dependencies: ["DataLife"]
        ),
        .testTarget(
            name: "ViewStateTests",
            dependencies: ["ViewState"]
        )
    ]
)
