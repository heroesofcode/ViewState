import ProjectDescription

public extension Project {

    static func targetScripts() -> [TargetScript] {
        let swiftLint = """
        if [[ "$(uname -m)" == arm64 ]]; then
            export PATH="/opt/homebrew/bin:$PATH"
        fi

        if which swiftlint > /dev/null; then
          swiftlint
        else
          echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
        fi
        """
        
        return [
            TargetScript.pre(
                script: swiftLint,
                name: "SwiftLint",
                basedOnDependencyAnalysis: false
            )
        ]
    }
}
