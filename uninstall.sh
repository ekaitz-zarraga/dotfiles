#!/bin/bash

# Link at home folder
stow -Dt ~ bash tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} -D nvim

# konsole colors
# stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole

# kitty
stow -Dt "${XDG_CONFIG_HOME:=$HOME/.config}/kitty" kitty

# Guix channels
stow -Dt "${XDG_CONFIG_HOME:=$HOME/.config}/guix" guix

# i3
stow -Dt "${XDG_CONFIG_HOME:=$HOME/.config}/i3" i3
stow -Dt "${XDG_CONFIG_HOME:=$HOME/.config}/i3status" i3status
# Plasma session environment variables
#stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/plasma-workspace/env" plasma-env
