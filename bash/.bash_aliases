# vimdiff style with nvim
alias nvimdiff='nvim -d'

# ssh as root -> Sysadmin trick
alias r='ssh -l root'

# fuck!
alias fuck='COMMAND=$(history -p \!\!); echo sudo $COMMAND; sudo $COMMAND'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
