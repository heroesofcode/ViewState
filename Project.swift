import ProjectDescription

let project = Project(
    name: "ViewState",
    organizationName: "heroesofcode",
    targets: [
        .target(
            name: "ViewState",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.heroesofcode.ViewState",
            deploymentTargets: .iOS("12.0"),
            sources: [
                "Sources/ViewState/**/*.swift",
            ],
            dependencies: []
        ),
        .target(
            name: "ViewStateTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.heroesofcode.ViewStateTests",
            deploymentTargets: .iOS("12.0"),
            sources: [
                "Tests/ViewStateTests/**/*.swift",
            ],
            dependencies: [
                .target(name: "ViewState"),
            ]
        )
    ]
)
