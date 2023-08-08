import ProjectDescription

extension Project {

    public static func settings() -> Settings {
        Settings.settings(base: baseSettings())
    }

    private static func baseSettings() -> SettingsDictionary {
        let baseSettings = SettingsDictionary()
            .currentProjectVersion("1")
            .marketingVersion("1.0")
            .debugInformationFormat(.dwarfWithDsym)
        return baseSettings
    }
}
