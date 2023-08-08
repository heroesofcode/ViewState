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
            sources: ["Sources/ViewState/**/*"],
            scripts: Project.targetScripts()
        ),
        Target(
            name: "Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.heroesofcode.viewstateTests",
            infoPlist: .default,
            sources: ["Tests/ViewStateTests/**/*"],
            dependencies: [
                .target(name: "ViewState")
            ]
        ),
        Target(
            name: "Example",
            platform: .iOS,
            product: .app,
            bundleId: "com.heroesofcode.ViewStateExample",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
            infoPlist: "Example/Example/Info.plist",
            sources: ["Example/Example/**"],
            resources: [
                "Example/Example/Resources/Assets.xcassets",
                "Example/Example/Resources/Base.lproj/**"
            ],
            scripts: Project.targetScripts(),
            dependencies: [
                .target(name: "ViewState")
            ],
            settings: Project.settings()
        ),
        Target(
            name: "ExampleTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.heroesofcode.ViewStateExampleTests",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Example/ExampleTests/**"],
            dependencies: [
                .target(name: "Example")
            ]
        )
    ]
)
