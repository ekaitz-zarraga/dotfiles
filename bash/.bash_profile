# Load in the git branch prompt script.
source ~/.git-prompt.sh

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
GREY="\[\033[0;37m\]"
DEFAULT="\[\033[0;39m\]"
WHITE=DEFAULT
PS1BASE="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}$GREEN\u@\h\[\033[00m\]:$BLUE\w\[\033[00m\]"
PS1GIT="$CYAN\$(__git_ps1)$DEFAULT"
PS1END="$DEFAULT\$ "
PS1="${PS1BASE}${PS1GIT}${PS1END}"

# TODO CHECK THIS, LOOKS INTERESTING
# PS1="$GREEN\t$RED - $BLUE\u$YELLOW\w\[\033[m\]$MAGENTA\$(__git_ps1)$WHITE\$ "

if [ -f ~/.bash_aliases ] ; then
	. ~/.bash_aliases
fi

# Extra configuration for work or home, just separate it in different file to keep dotfiles clean
if [ -f ~/.bash_extra ] ; then
	. ~/.bash_extra
fi

export TERM=xterm-256color
export EDITOR=vim

# NeoVim configuration
# Create .config if it doesn't exist and set XDG vars
mkdir -p $HOME/.config
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.config}


# Pandoc bash completion
eval "$(pandoc --bash-completion)"

# Guix
if [ -n "$GUIX_ENVIRONMENT" ] # Change prompt if shell is in an environment
then
    PS1GUIXENV="$YELLOW(guix-env)$DEFAULT"
    PS1="${PS1BASE}${PS1GIT}${PS1GUIXENV}${PS1END}"
fi
export PATH="/home/ekaitz/.config/guix/current/bin${PATH:+:}$PATH"
export PATH="/home/ekaitz/.guix-profile/bin${PATH:+:}$PATH"
export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale" # Locale directory


# Guile (guix)
export GUILE_LOAD_PATH="/home/ekaitz/.guix-profile/share/guile/site/2.2${GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH"
export GUILE_LOAD_COMPILED_PATH="/home/ekaitz/.guix-profile/lib/guile/2.2/site-ccache${GUILE_LOAD_COMPILED_PATH:+:}$GUILE_LOAD_COMPILED_PATH"

# Direnv
eval "$(direnv hook bash)"
