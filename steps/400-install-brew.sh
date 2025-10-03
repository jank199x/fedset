if [ ! -d /home/linuxbrew ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
	&& echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >| ${HOME}/.config/bash/02-linuxbrew.bashrc \
	&& eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
	&& sudo dnf group install -y development-tools \
	&& brew install gcc
fi
