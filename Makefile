XCODEBUILD:=xcodebuild

default: build

build:
	$(XCODEBUILD) -scheme Breit-iOS
	$(XCODEBUILD) -scheme Breit-macOS
	$(XCODEBUILD) -scheme Breit-tvOS
	$(XCODEBUILD) -scheme Breit-watchOS

clean:
	$(XCODEBUILD) -scheme Breit-iOS clean
	$(XCODEBUILD) -scheme Breit-macOS clean
	$(XCODEBUILD) -scheme Breit-tvOS clean
	$(XCODEBUILD) -scheme Breit-watchOS clean
archive:
	carthage build --no-skip-current
	carthage archive Breit


.PHONY: test clean default
