#!/bin/bash

# Link at home folder
stow --dotfiles -Dt ~ bash tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)

# NeoVim
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} nvim

# Shepherd
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} shepherd

# konsole colors
# stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole

# kitty
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} kitty

# redshift
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} redshift

# Guix channels
stow -Dt "${XDG_CONFIG_HOME:=$HOME/.config}/guix" guix

# i3
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} i3
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} i3status
# Plasma session environment variables
#stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/plasma-workspace/env" plasma-env

# newsboat
stow -Dt ${XDG_CONFIG_HOME:=$HOME/.config} newsboat
