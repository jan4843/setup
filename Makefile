$(basename $(notdir $(wildcard profiles/*.rb))):
	@PROFILE=$@ bash ./setup.sh
