#!/bin/bash

# Initializes variables and creates buffer
init_main()
{
	# Create the 'screen buffer'
	create_buffer

	# Capture Ctrl+C key combination to call the 'quit'
	# function when Ctrl+C key combination is pressed
      #trap quit SIGINT
	
	# Clear the terminal screen
	clear >> ${buffer}
	refresh_screen
}
