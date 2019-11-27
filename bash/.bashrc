# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# VARIABLE EXPORTS
######################################################################
export COLOR_BLACK="\[\033[0;30m\]"
export COLOR_RED="\[\033[0;31m\]"
export COLOR_GREEN="\[\033[0;32m\]"
export COLOR_YELLOW="\[\033[0;33m\]"
export COLOR_BLUE="\[\033[0;34m\]"
export COLOR_MAGENTA="\[\033[0;35m\]"
export COLOR_CYAN="\[\033[0;36m\]"
export COLOR_GREY="\[\033[0;37m\]"
export COLOR_DEFAULT="\[\033[0;39m\]"
export COLOR_WHITE=$COLOR_DEFAULT

export EDITOR=nvim

# Guile (guix)
export GUILE_LOAD_PATH="$HOME/.guix-profile/share/guile/site/2.2${GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH"
export GUILE_LOAD_COMPILED_PATH="$HOME/.guix-profile/lib/guile/2.2/site-ccache${GUILE_LOAD_COMPILED_PATH:+:}$GUILE_LOAD_COMPILED_PATH"

export PATH="$HOME/.config/guix/current/bin${PATH:+:}$PATH"
export PATH="$HOME/.guix-profile/bin${PATH:+:}$PATH"
export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale" # Locale directory

######################################################################

# Pandoc bash completion
eval "$(pandoc --bash-completion)"

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Load aliases
if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

# PROMPT 
PS1BASE="\[\e]0;\u: \w\a\]${debian_chroot:+($debian_chroot)}$COLOR_BLUE\u\[\033[00m\] $COLOR_YELLOW\w\[\033[00m\]"

#PS1BASE="$COLOR_CYAN\u $COLOR_YELLOW\w\[\033[m\]"
PS1GIT="$COLOR_BLUE\$(__git_ps1)$COLOR_DEFAULT"
PS1END="$COLOR_DEFAULT\$ "
export PS1="${PS1BASE}${PS1GIT}${PS1END}"

# Guix
if [ -n "$GUIX_ENVIRONMENT" ] # Change prompt if shell is in an environment
then
    PS1GUIXENV="$COLOR_RED(guixenv)$COLOR_DEFAULT"
    PS1="${PS1BASE}${PS1GIT}${PS1GUIXENV}${PS1END}"
fi
export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"

# Python virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# Microchip
export PATH="$PATH:/opt/microchip/xc8/v1.44/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Direnv
eval "$(direnv hook bash)"

