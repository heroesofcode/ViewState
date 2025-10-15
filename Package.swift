// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let useSwiftLint = false

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
    dependencies: useSwiftLint ? [
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.61.0")
    ] : [],
    targets: [
        .target(
            name: "ViewState",
            dependencies: [],
            plugins: useSwiftLint ? [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ] : []
        ),
        .testTarget(
            name: "ViewStateTests",
            dependencies: ["ViewState"]
        )
    ]
)
