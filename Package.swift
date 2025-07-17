// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewState",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ViewState",
            targets: ["ViewState"]
        )
    ],
    targets: [
        .target(
            name: "ViewState",
            dependencies: []
        ),
        .testTarget(
            name: "ViewStateTests",
            dependencies: ["ViewState"]
        )
    ]
)
