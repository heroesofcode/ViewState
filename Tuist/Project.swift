import ProjectDescription

let project = Project(
    name: "ViewState",
    organizationName: "heroesofcode",
    targets: [
        Target(
            name: "ViewState",
            platform: .iOS,
            product: .framework,
            bundleId: "com.heroesofcode.ViewState",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "ViewStateTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.heroesofcode.ViewStateTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "ViewState")
            ]
        )
    ]
)
