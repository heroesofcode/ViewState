test:
	set -o pipefail
	xcodebuild -project ViewState.xcodeproj \
           -scheme ViewState-Package \
           -destination platform=iOS\ Simulator,name=iPhone\ 8 \
           clean test | xcpretty
