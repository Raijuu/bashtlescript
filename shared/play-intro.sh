#!/bin/bash

# Plays intro: prints animated frames and intro text to the screen
play_intro()
{
	# Intro text
	if [[ "$intro_text" == "" ]]
	then
		intro_text="${top_padding}${left_padding}     Some game or something man, who knows"
	fi
	
	# Print intro text into the screen buffer
	printf ${intro_text} >> ${buffer}
	
	# Play animation, exit from loop when a key was pressed
	while true
	do
		print_frame_stage1
		refresh_screen
		read_continue_key
		print_frame_stage2
		refresh_screen
		read_continue_key
		print_frame_stage3
		refresh_screen
		read_continue_key
		print_frame_stage4
		refresh_screen
		read_continue_key
		print_frame_stage5
		refresh_screen
		read_continue_key
	done
	
	# Clear and refresh screen
	clear >> ${buffer}
	refresh_screen
}
