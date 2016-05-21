#!/bin/bash

# Link at home folder
stow -t ~ bash vim tmux git

# Link at XDG_CONFIG_HOME if set, if not to $HOME/.config (they should be the same)
stow -t ${XDG_CONFIG_HOME:=$HOME/.config} nvim
