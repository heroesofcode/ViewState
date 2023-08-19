test:
	bundle exec fastlane tests

build:
	set -o pipefail && xcodebuild build -scheme "ViewState" -destination "platform=iOS Simulator,name=IPhone 14" | xcpretty
