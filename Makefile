test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=iOS Simulator,name=iPhone 17,OS=26.1" \
		clean test | xcpretty

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=macOS" \
		clean test | xcpretty
