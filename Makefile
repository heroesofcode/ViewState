test:
	xcodebuild -workspace ViewState.xcworkspace \
               -scheme ViewState \
               -destination platform=iOS\ Simulator,OS=16.0,name=iPhone\ 14 \
               -enableCodeCoverage YES \
               clean test | xcpretty

build:
	set -o pipefail && xcodebuild build -scheme "ViewState" -destination "platform=iOS Simulator,name=IPhone 14" | xcpretty
