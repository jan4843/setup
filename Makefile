export PATH := /opt/homebrew/bin:$(PATH)

PROFILES := $(basename $(notdir $(wildcard brew/*.rb)))

.SILENT:

_help:
	echo usage:
	printf '  make %s\n' $(PROFILES)

$(PROFILES):
	find scripts/* \
		-exec tput rev \; \
		-print \
		-exec tput sgr0 \; \
		-exec bash {} $@ \;
