#!/usr/bin/env sh

if hash pacman 2>/dev/null; then
  sudo pacman -S yay thefuck exa fzf zsh tmux xclip ranger neovim ripgrep python-pynvim kitty
fi

# curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
# sudo chsh -s $(which zsh) $(whoami)
