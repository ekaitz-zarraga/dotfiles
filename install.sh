#!/bin/bash

# Link at home folder
stow --dotfiles -Rt ~ bash tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} nvim

# konsole colors
# stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole

# kitty
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} kitty

# Guix channels
stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/guix" guix

# i3
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} i3
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} i3status
# Plasma session environment variables
#stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/plasma-workspace/env" plasma-env

# Shepherd user services
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} shepherd
