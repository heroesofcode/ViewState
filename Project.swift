import ProjectDescription
import ProjectDescriptionHelpers

let viewState = Target(
    name: "ViewState",
    platform: .iOS,
    product: .framework,
    bundleId: "com.heroesofcode.viewstate",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    sources: ["Sources/ViewState/**/*"],
    scripts: Project.targetScripts()
)

let tests =  Target(
    name: "Tests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "com.heroesofcode.viewstateTests",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    infoPlist: .default,
    sources: ["Tests/ViewStateTests/**/*"],
    dependencies: [
        .target(name: "ViewState")
    ]
)

let example = Target(
    name: "Example",
    platform: .iOS,
    product: .app,
    bundleId: "com.heroesofcode.ViewStateExample",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone]),
    infoPlist: "Example/Example/Info.plist",
    sources: ["Example/Example/**/*"],
    resources: [
        "Example/Example/Resources/Assets.xcassets",
        "Example/Example/Resources/Base.lproj/**"
    ],
    scripts: Project.targetScripts(),
    dependencies: [
        .target(name: "ViewState")
    ],
    settings: Project.settings()
)

let exampleTests = Target(
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

let project = Project(
    name: "ViewState",
    targets: [viewState, tests, example, exampleTests]
)
