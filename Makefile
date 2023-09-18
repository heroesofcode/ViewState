test:
	set -o pipefail
	xcodebuild -project MagicImages.xcodeproj \
           -scheme MagicImages-Package \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           clean test | xcpretty

build:
	set -o pipefail
	xcodebuild -project MagicImages.xcodeproj \
           -scheme MagicImages-Package \
           -destination platform=iOS\ Simulator,name=iPhone\ 14 \
           build | xcpretty
