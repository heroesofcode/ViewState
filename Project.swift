import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ViewState",
    targets: [
        Target(
            name: "ViewState",
            platform: .iOS,
            product: .framework,
            bundleId: "com.heroesofcode.viewstate",
            sources: [
                "Sources/ViewState/**/*"
            ],
            scripts: Project.targetScripts()
        ),
        Target(
            name: "Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.heroesofcode.viewstateTests",
            infoPlist: .default,
            sources: [
                "Tests/ViewStateTests/**/*"
            ],
            dependencies: [
                .target(name: "ViewState")
            ]
        )
    ]
)
