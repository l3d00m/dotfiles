#!/usr/bin/env sh

if hash pacman 2>/dev/null ; then
    sudo pacman -Sy thefuck exa fzf zsh tmux xclip
    yay -Su ccat
elif hash apt-get 2>/dev/null ; then
    sudo apt install -y thefuck exa fzf zsh tmux xclip
fi

sudo chsh -s $(which zsh) $(whoami)
