#!/bin/bash

# Link at home folder
stow -Rt ~ bash tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} nvim

# konsole colors
# stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole

# kitty
stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/kitty" kitty

# Guix channels
stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/guix" guix

# Plasma session environment variables
#stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/plasma-workspace/env" plasma-env
