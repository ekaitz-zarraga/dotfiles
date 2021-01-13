# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

source /etc/bashrc

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
PATH=$PATH:$HOME/.local/bin

# PROMPT
PS1BASE="$COLOR_BLUE\u$COLOR_GREY@\h $COLOR_YELLOW\w\[\033[00m\]"

#PS1BASE="$COLOR_CYAN\u $COLOR_YELLOW\w\[\033[m\]"
PS1GIT="$COLOR_BLUE\$(__git_ps1)$COLOR_DEFAULT"
PS1END="$COLOR_DEFAULT\$ "
export PS1="${PS1BASE}${PS1GIT}${PS1END}"

# GUIX
######################################################################

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1="$PS1BASE$PS1GIT [env]$PS1END"
fi
######################################################################

# Pandoc bash completion
if hash pandoc 2>/dev/null; then
    eval "$(pandoc --bash-completion)"
fi

# Load in the git branch prompt script.
source ~/.git-prompt.sh

# Load aliases
if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

