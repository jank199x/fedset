#!/bin/bash

set -e

# Define style variables
STYLE_RESET="\e[0m"
STYLE_BOLD="\e[1m"
STYLE_INVERTED="\e[7m"
STYLE_RESET_INVERTED="\e[27m"
COLOR_OFF='\033[0m'
COLOR_GREEN='\033[0;32m' 

source ./titlecard.sh

steptitle() {
  echo -e "\n\t${STYLE_BOLD}${STYLE_INVERTED} Step $1 ${STYLE_RESET_INVERTED} $2${STYLE_RESET}\n"
}

STEP=0

source HOSTNAME
USER=${USER:-$(whoami)}
HOME=${HOME:-/home/${USER}}
BASH_CONFIG_DIR="$HOME/.config/bash"
LOCAL_OPT_DIR="$HOME/.local/opt"
LOCAL_BIN_DIR="$HOME/.local/bin"
LOCAL_FONTS_DIR="$HOME/.local/share/fonts"

# Function to ensure a directory exists, creating it if necessary
ensure_dir() {
    local dir_path="$1"
    if [ ! -d "$dir_path" ]; then
        mkdir -p "$dir_path"
    fi
}

#####################

sudo -v &> /dev/null
if [ $? -ne 0 ]; then

# Ask for sudo access upfront but do not run the whole script with sudo
sudo -v  # This will ask the user for the password once.

# Keep the sudo timestamp alive for the rest of the script
( while true; do sudo -v; sleep 60; done ) &
fi

for file in steps/*.sh; do
  if [ -f "$file" ]; then
    ((STEP+=1))
    steptitle $STEP $file
    set -v
    echo -e "$COLOR_GREEN"
    . "$file"
    echo -e "$COLOR_OFF"
    set +v
  fi
done

set +e

echo -e "\n\t${STYLE_BOLD}${STYLE_INVERTED} Setup finished. ${STYLE_RESET}\n"
echo -e "\n\t${STYLE_BOLD}Press Enter to ${STYLE_INVERTED} reboot ${STYLE_RESET_INVERTED} or Ctrl+C to exit.${STYLE_RESET}\n" && read

systemctl reboot

