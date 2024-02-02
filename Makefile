test-ios:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=iOS Simulator,name=IPhone 15" clean test | xcpretty

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

test-watchos:
	set -o pipefail && \
	xcodebuild test \
		-scheme ViewState \
		-destination "platform=watchOS Simulator,name=Apple Watch Series 8 (41mm)" clean test | xcpretty
