#TEST
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# This apparently is bashrc satan, cross check with the bashrc at work
export TERM=xterm-256color

# Prompt stuff
LIGHT_BLUE="\e[94m"
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"


_git_info() {
    git rev-parse --is-inside-work-tree &> /dev/null

    if [[ $? == 0 ]]; then
        br_name=$(git branch --show-current)

        # Get number of insertions and deletions
        s=$( git diff --shortstat 2>/dev/null )
        reg='([0-9]) insertion'
        if [[  $s =~ $reg ]]; then
                _insertions="${GREEN}${BASH_REMATCH[1]}${ENDCOLOR}"
        else
                _insertions=""
        fi

        reg='([0-9]) deletion'
        if [[  $s =~ $reg ]]; then
                _deletions="${RED}${BASH_REMATCH[1]}${ENDCOLOR}"
        else
                _deletions=""
        fi

        printf \($br_name
        if [[ ! -z "$_insertions" ]]; then
                printf " $_insertions"
        fi

        if [[ ! -z "$_deletions" ]]; then
                printf " $_deletions"
        fi

        printf ') '
    else
        echo ""
    fi
}

_return_code() {
        code=$?
        if [[ $code == 0 ]]; then
                printf "${LIGHT_BLUE}0${ENDCOLOR} "
        else
                printf "${RED}$code${ENDCOLOR} "
        fi
}

# Non-printing color control sequences are enclosed in \[\033 .... m\]
# https://askubuntu.com/questions/831971/what-type-of-sequences-are-escape-sequences-starting-with-033
# <Background code>;<foreground code>
uC="\[\033[01;32m\]" # User color
uC="\[\033[02;37m\]" # ACtually kinda nice light grey
pC="\[\033[01;34m\]" # Path color
pC="\[\033[33;02m\]" 
sC=$LIGHT_BLUE # Status code color
eC="\[\033[00m\]" # End color

#PS1='`_return_code`\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] `_git_info`\$ ' # Acceptable
PS1="`_return_code`${uC}\u@\h${eC}:${pC}\w${eC} `_git_info`\$ " # Acceptable

# Custom stuff
PATH=$PATH:~/dotfiles/bins
alias fix_keychron='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode'
