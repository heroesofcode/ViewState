// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewState",
    platforms: [.iOS(.v9), .macOS(.v10_11), .tvOS(.v9)],
    products: [
        .library(
            name: "ViewState",
            targets: ["ViewState"])
    ],
    targets: [
        .target(
            name: "ViewState",
            dependencies: []),
        .testTarget(
            name: "ViewStateTests",
            dependencies: ["ViewState"])
    ]
)
