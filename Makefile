export PATH := /opt/homebrew/bin:$(PATH)

PROFILES := $(basename $(notdir $(wildcard brew/*.rb)))

.SILENT:

_help:
	echo usage:
	printf '  make %s\n' $(PROFILES)

$(PROFILES):
	for script in scripts/*; do \
		tput rev; echo $$script; tput sgr0; \
		bash $$script $@ || exit $$?; \
	done
