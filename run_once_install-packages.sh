#!/usr/bin/env sh

if hash pacman 2>/dev/null ; then
    sudo pacman -Sy thefuck exa fzf zsh tmux xclip ranger
    yay -Su ccat
elif hash apt-get 2>/dev/null ; then
    sudo apt install -y thefuck exa fzf zsh tmux xclip ranger
fi

curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
sudo chsh -s $(which zsh) $(whoami)
