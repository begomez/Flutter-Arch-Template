

setup:
	@flutter pub get
	@flutter doctor --android-licenses
	@cd android && gradle && gradle wrapper && cd ..
	@cd ios && pod install && cd ..

drive:
	@flutter drive --target=test_driver/app.dart

test:
	@flutter test

clean:
	@cd android && ./gradlew clean && cd ..
	@flutter clean

coverage:
	@rm -rf coverage
	@flutter test --coverage
	@lcov --remove coverage/lcov.info "***/constants*/**" "**/*.g.dart" "**/fake*.dart"  -o coverage/lcov_cleaned.info
	@genhtml coverage/lcov_cleaned.info -o coverage/html
	@open coverage/html/index.html


build_runner:
	@flutter pub run build_runner build --delete-conflicting-outputs
	@flutter format --line-length=120 .


check_branch:
	flutter analyze .
	@flutter test
	@flutter pub run build_runner build --delete-conflicting-outputs
	@flutter format --line-length=120 .

cover: 
	@flutter test --coverage
	@genhtml -o coverage coverage/lcov.info
	@open coverage/index.html

.PHONY: setup drive test clean coverage check_branch cover
