#!/bin/bash

# Save terminal screen
tput smcup
#blank out internal field seperator
IFS=""



# ** SET VARIABLE DEFAULTS AND GLOBALS FOR GAME **

#get screen size
term_width=$(tput cols)
term_height=$(tput lines)

# set min max for game
min_term_width=80
min_term_height=22

# Set buffer defaults
buffer_name=""
buffer_directory=""
buffer=""

# set padding defaults for screen buffer
left_padding=""
left_padding_width=$(($((term_width - min_term_width)) / 2))
top_padding=""
top_padding_height=$(($((term_height - min_term_height)) / 2))

# Set $left_padding from $left_padding_width left_padding will contain a number of  $left_padding_width space characters
for ((i=0; i < left_padding_width; i++))
do
	left_padding="${left_padding} "
done
	
# Set $top_padding from $top_padding_height $top_padding will contain a number of $top_padding_height newline characters
for ((i=0; i < top_padding_height; i++))
do
	top_padding="${top_padding}\n"
done

#set game variable defaults

game_name="Hung-Man"

# Intro text    (80 x 18 including border stars)							   |
intro_text="\
\n\n${top_padding}${left_padding}\
                          Hung (process) Man (page)\n   \
\n\n${left_padding}\
                         Copyright (C) Grant White 2015\n\
\n${left_padding}\
            This is a word guessing game written completely in Bash.\n\
\n${left_padding}\
         The Player guesses one letter of the mystery word at a time.\
\n${left_padding}\
     Each wrong answer gets the hangman closer to his goal and the player\
\n${left_padding}\
                             closer to failure.\
\n\n\n${left_padding}\
                        Press any key to continue"
                        

player1_name=""
player2_name=""

player1_score=""
player2_score=""

# declare -1 = array / declare -A = associative array (with keys)
#declare -a player1_coordinates
#declare -A player1_throw_animation_frame1

next_player=""

total_points=""
menu_choice=""

declare -A grid
grid_width=""
grid_height=""


# ** LOAD EXTERNAL MODULES
# external files can be game specific or come from shared "library" directory

script_directory=$(dirname "$0")/hmfiles
shared_directory=$(dirname "$0")/shared

# Include necessary source files
#shared
source "${shared_directory}/check-prerequisites.sh"
source "${shared_directory}/init-main.sh"
source "${shared_directory}/create-buffer.sh"
source "${shared_directory}/intro-outro-marquee.sh"
source "${shared_directory}/play-intro.sh"
source "${shared_directory}/read-continue-key.sh"
source "${shared_directory}/quit.sh"
source "${shared_directory}/refresh-screen.sh"



#unique
source "${script_directory}/main-loop.sh"


# ** CHECK PREREQUISITES AND START THE GAME **
check_prerequisites ${term_width} ${term_height}

main_loop