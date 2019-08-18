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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# alias for Node.js projects
alias ntree='tree -I node_modules'
# alias for Clojure projects
alias ctree='tree -I target'

# Clean whiteboards!
# found at: https://gist.github.com/lelandbatey/8677901
alias whiteboard="convert $1 -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 $2"

# Pandoc for ElenQ
alias pandoc-xelatex="pandoc $@ --latex-engine=xelatex --to latex -N"
alias elenqdoc-article="pandoc-xelatex $@ --template elenq-article --metadata=documentclass:article"
alias elenqdoc-book="pandoc-xelatex $@  --template elenq-book --metadata=documentclass:book"
