export SHELL := bash
export .SHELLFLAGS := -euo pipefail -c

# for dev environment
.PHONY: install-npm
install-npm: | package-lock.json;
package-lock.json: package.json
	npm install

# for artifacts
.DEFAULT_GOAL := check
TARGET_FILES := slog
.PHONY: test lint check
test: $(TARGET_FILES)
	shellcheck $<
lint: $(TARGET_FILES)
	shfmt -d -s $<
check: test lint;
