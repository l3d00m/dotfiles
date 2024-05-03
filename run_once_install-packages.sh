#!/usr/bin/env sh

if hash pacman 2>/dev/null; then
	sudo pacman -S yay thefuck exa fzf zsh tmux xclip ranger neovim ripgrep python-pynvim eslint_d
	yay -S ccat ttf-meslo-nerd-font-powerlevel10k fpp-git urlview prettierd
elif hash apt-get 2>/dev/null; then
	sudo apt install -y thefuck exa fzf zsh tmux xclip ranger
fi

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
# sudo chsh -s $(which zsh) $(whoami)
