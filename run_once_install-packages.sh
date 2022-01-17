#!/usr/bin/env sh

if hash pacman 2>/dev/null ; then
    sudo pacman -S thefuck
elif hash apt-get 2>/dev/null ; then
    sudo apt install thefuck
fi

curl -L git.io/antigen > ~/antigen.zsh
