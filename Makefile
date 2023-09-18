test:
	set -o pipefail
	xcodebuild -project ViewState.xcodeproj \
           -scheme ViewState-Package \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           clean test | xcpretty

build:
	set -o pipefail
	xcodebuild -project ViewState.xcodeproj \
           -scheme ViewState-Package \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           build | xcpretty
