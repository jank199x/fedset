MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)
PERCENTAGE=20
NEW_BRIGHTNESS=$(echo "$MAX_BRIGHTNESS * $PERCENTAGE / 100" | bc)

echo -e "\n\t${STYLE_BOLD}\tDo you want to change the brightness to $PERCENTAGE% of the maximum value? [y/N]:${STYLE_RESET}"
read USER_INPUT
if [[ "$USER_INPUT" =~ ^[Yy]$ ]]; then
    echo "$NEW_BRIGHTNESS" | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
