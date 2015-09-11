#!/bin/bash

# Check availability of necessary programs and minimum terminal size
check_prerequisites()
{
	# Check if 'tput' command is available
	which tput > /dev/null
	
	# If 'tput' is not available, then print
	# error message and exit with status code '2'
	if (($? != 0))
	then
		# Restore terminal screen
		tput rmcup
		
		printf "\
Your system is missing the program 'tput' which is necessary for\n\
${game_name} to run. 'tput' can be found in the following packages on \n\
the following distributions:\n\
Distribution        Package name\n\
---------------------------------\n\
Arch Linux          ncurses\n\
Debian              ncurses-bin\n\
Fedora              ncurses\n\
openSUSE            ncurses-utils\n\
Ubuntu              ncurses-bin\n"
		
		exit 2
	fi
	
	# Check if 'bc' command is available
	which bc > /dev/null
	
	# If 'bc' is not available, then print
	# error message and exit with status code '2'
	if (($? != 0))
	then
		# Restore terminal screen
		tput rmcup
		
		printf "\
Your system is missing the program 'bc' which is necessary for ${game_name}\n\
to run. 'bc' can be found in the 'bc' package on most Linux distributions.\n"
		
		exit 2
	fi
	
	# Check if terminal has at least $min_term_width columns and
	# $min_term_height lines
	#
	# If either terminal width or height is less than
	# $min_term_width and $min_term_height print error message
	# and exit with status code '3'
	if ((term_width < min_term_width || term_height < min_term_height))
	then
		# Restore terminal screen
		tput rmcup
		
		printf "\
${game_name} needs a terminal with size of at least \n\
${min_term_width}x${min_term_height} (${min_term_width} columns, ${min_term_height} lines).\n"
		
		exit 3
	fi
}