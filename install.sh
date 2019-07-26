#!/bin/bash

# Link at home folder
stow -Rt ~ bash vim tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -Rt ${XDG_CONFIG_HOME:=$HOME/.config} nvim

# konsole colors
stow -Rt "${XDG_CONFIG_HOME:=$HOME/.config}/konsole" konsole
