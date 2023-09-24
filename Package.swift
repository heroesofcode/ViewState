// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewState",
    platforms: [.iOS(.v12), .macOS(.v10_15), .tvOS(.v13)],
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
