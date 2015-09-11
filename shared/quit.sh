#!/bin/bash

# Cleans up on quit, returns '0'
quit()
{
	# Delete screen buffer file
	rm ${buffer}
	
	# Restore terminal screen
	tput rmcup
	
	# Exit with status '0'
	exit 0
}

