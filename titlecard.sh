VERSION=$(git rev-parse --short HEAD)
UPDATED=$(git log -1 --format=%cd)
# ASCII art made at http://patorjk.com/software/taag/
ART=$(cat ./ART)
echo -e "\n$(base64 --decode <<<${ART} | gunzip)\n"
echo -e "\t${STYLE_BOLD}Janky Fedora Setup Script ver. ${VERSION}\n\tUpdated ${UPDATED}${STYLE_RESET}\n"
echo -e "\t${STYLE_BOLD}${STYLE_INVERTED}     This script requires sudo access!     ${STYLE_RESET}"
echo -e "\t${STYLE_BOLD}${STYLE_INVERTED} Please enter your password when prompted. ${STYLE_RESET}\n"
echo -e "\t${STYLE_BOLD}Press Enter to continue or Ctrl+C to exit.${STYLE_RESET}" && read

