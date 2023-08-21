test:
	set -o pipefail && xcodebuild test -scheme "ViewState" -destination "platform=iOS Simulator,name=IPhone 14" clean test | xcpretty

build:
	set -o pipefail && xcodebuild build -scheme "ViewState" -destination "platform=iOS Simulator,name=IPhone 14" | xcpretty
