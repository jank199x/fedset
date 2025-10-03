if [ ! -f "$HOME/.config/bash/03-ssh-agent.bashrc" ] && [ -d "$HOME/.ssh" ]; then
cat > "$HOME/.config/bash/03-ssh-agent.bashrc" << 'EOF'
# Ensure that we have an SSH configuration with AddKeysToAgent set to true
if [ ! -f ~/.ssh/config ] || ! cat ~/.ssh/config | grep AddKeysToAgent | grep yes > /dev/null; then
echo "AddKeysToAgent  yes" >> ~/.ssh/config
fi
# Ensure a ssh-agent is running, so you only have to enter keys once
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
eval `ssh-agent`
ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

EOF
fi
