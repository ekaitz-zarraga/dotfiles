# Load in the git branch prompt script.
source ~/.git-prompt.sh
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1)\[$WHITE\]\$ "

if [ -f .bash_aliases ] ; then
	. .bash_aliases
fi

if [ -f .bashrc ]; then
	. .bashrc
fi
