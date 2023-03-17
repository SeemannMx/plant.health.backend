default: check_asdf check_dart check_dart_frog run_pub_get 

check_asdf:
	@asdf --version
	@echo "✅ asdf"

check_dart:
	@dart --version
	@dart pub global activate dart_frog_cli
	@echo "✅ dart"

check_dart_frog:
	@dart_frog --version
	@echo "✅ dart_frog"

build_backend:
	@dart_frog build

run_backend:
	@dart_frog build
	@dart_frog dev

run_pub_get:
	@dart pub get

run_test:
	@dart test test/*

analyze:
	@dart analyze