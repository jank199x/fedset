SENSIBLE_BASH_URL=https://raw.githubusercontent.com/mrzool/bash-sensible/refs/heads/master/sensible.bash
SENSIBLE_BASH_RC_FILE="00-sensible-bash.bashrc"

if [ ! -f "$SENSIBLE_BASH_RC_FILE" ]; then
	wget -O "$BASH_CONFIG_DIR/$SENSIBLE_BASH_RC_FILE" $SENSIBLE_BASH_URL
fi

