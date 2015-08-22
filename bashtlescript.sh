#!/bin/bash

# bashtlescript is a guessing game with a naval combat theme
# in Bash.
# Copyright (C) 2015 Grant White 
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program (LICENSE).
# If not, see <http://www.gnu.org/licenses/>.

# Save terminal screen
tput smcup

IFS=""


term_width=$(tput cols)
term_height=$(tput lines)

min_term_width=80
min_term_height=22

buffer_name=""
buffer_directory=""
buffer=""

left_padding=""
left_padding_width=$(($((term_width - min_term_width)) / 2))
top_padding=""
top_padding_height=$(($((term_height - min_term_height)) / 2))

player1_name=""
player2_name=""

player1_score=""
player2_score=""

declare -a player1_coordinates
declare -a player2_coordinates

next_player=""

total_points=""
menu_choice=""

declare -A grid
grid_width=""
grid_height=""

script_directory=$(dirname "$0")/bsfiles

#     echo $script_directory
# Include necessary source files
source "${script_directory}/check-prerequisites.sh"
source "${script_directory}/create-buffer.sh"
source "${script_directory}/init_main.sh"
source "${script_directory}/main-loop.sh"
source "${script_directory}/play-intro.sh"
source "${script_directory}/print-intro-outro-frames.sh"
source "${script_directory}/read-intro-outro-continue-key.sh"
source "${script_directory}/refresh-screen.sh"

check_prerequisites ${term_width} ${term_height}

# Parse option flags and their arguments
while getopts ":w:s:h" option
do
	case ${option} in
		h)
			tput rmcup
			printf "bash-tle-script Copyright (C) Grant White \
2015\n\
For more detailed help please see the file 'README.md'.\n"
			exit 0
			;;

		\?)
			tput rmcup
			printf "Invalid option: -${OPTARG}.\n"
			exit 1
			;;
	esac
done

main_loop