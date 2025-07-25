#!/usr/bin/env sh

if hash pacman 2>/dev/null; then
  sudo pacman -S eza fzf zsh tmux xclip ranger neovim urlscan ripgrep python-pynvim kitty neomutt zoxide nvm autorandr firefox polybar lazygit
fi

# curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
# sudo chsh -s $(which zsh) $(whoami)
