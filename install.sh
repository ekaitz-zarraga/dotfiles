#!/bin/bash

echo ${XDG_CONFIG_HOME:=$HOME/.config}

# Link at home folder
stow --dotfiles -Rt$HOME bash tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -Rt $XDG_CONFIG_HOME nvim

# konsole colors
# stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole

# kitty
stow -Rt $XDG_CONFIG_HOME kitty
# Alacritty (tries to replace kitty)
stow -Rt $XDG_CONFIG_HOME alacritty

# Guix channels
stow -Rt "$XDG_CONFIG_HOME/guix" guix

# i3
stow -Rt $XDG_CONFIG_HOME i3
stow -Rt $XDG_CONFIG_HOME i3status
# Plasma session environment variables
#stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/plasma-workspace/env" plasma-env

# Shepherd user services
stow -Rt $XDG_CONFIG_HOME shepherd

# Redshift
stow -Rt $XDG_CONFIG_HOME redshift
