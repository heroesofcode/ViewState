test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=iOS Simulator,name=iPhone 16,OS=18.0" \
		clean test | xcpretty

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=macOS" \
		clean test | xcpretty

test-tvos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=tvOS Simulator,name=Apple TV 4K (3rd generation),OS=18.0" \
		clean test | xcpretty

test-watchos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=watchOS Simulator,name=Apple Watch Series 9 (45mm),OS=11.0" \
		clean test | xcpretty
