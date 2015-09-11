#!/bin/bash

# Main loop of the game
main_loop()
{
	# Initialize variables, create screen buffer for game
	init_main

	# Play intro and wait for keypress
	play_intro

	# Clear the screen
	clear >> ${buffer}
	refresh_screen


	# Clean up and exit with 0
	quit
}
# **-- main-loop.sh END
