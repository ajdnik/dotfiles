#!/usr/bin/env bash

#
# colors.sh
# Colorized bash output.
#


RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[1;34m'
MAGENTA=$'\e[1;35m'
CYAN=$'\e[1;36m'
RESET=$'\e[0m'
BOLD=$'\e[1m'
DIM=$'\e[2m'
UNDERLINE=$'\e[4m'

print_footer() {
  printf -- "${MAGENTA}${BOLD}\n#\n# ${1}\n#\n\n${RESET}"
}

print_header() {
  printf -- "${CYAN}${BOLD}\n#\n# ${1}\n#\n\n${RESET}"
}

print_step() {
  printf -- "${GREEN}${UNDERLINE}${1}\n${RESET}"
}

print_command() {
  printf -- ">> ${1}\n\n"
}

start_command_output() {
  printf -- "${DIM}"
}

end_command_output() {
  printf -- "\n${RESET}"
}

