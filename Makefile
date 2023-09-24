test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=iOS Simulator,name=IPhone 14" clean test | xcpretty

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination platform="macOS" clean test | xcpretty

test-tvos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination platform="tvOS Simulator,name=Apple TV 4K" clean test | xcpretty
