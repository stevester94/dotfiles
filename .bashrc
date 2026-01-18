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
# Colors taken from https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
# I honestly don't get what the deal is with these escape codes. If you remove that extra printf then they get printed as literals
# It's something to do with how strings are escaped, but for the life of me I don't get it.
# Oh well, these commands are only executed when a new shell is opened so its not the end of the world.
LIGHT_BLUE=`printf "\001$(tput setaf 111)\002"`
RED=`printf "\001$(tput setaf 196)\002"`
GREEN=` printf "\001$(tput setaf 112)\002"`
LIGHT_GREY=`printf "\001$(tput setaf 250)\002"`
LIGHT_ORANGE=`printf "\001$(tput setaf 214)\002"`
DARK_ORANGE=`printf "\001$(tput setaf 202)\002"`
LIGHT_GREEN=`printf "\001$(tput setaf 082)\002"`
BLUE=`printf "\001$(tput setaf 020)\002"`
RESET_COLOR=`printf "\001$(tput sgr0)\002"`

uC=$LIGHT_GREY # User and host
pC=$DARK_ORANGE
sC=$LIGHT_BLUE
eC=$RESET_COLOR

source ~/dotfiles/hostcolors.sh
if test -f ~/dotfiles/work/hostcolors.sh ; then
   source ~/dotfiles/work/hostcolors.sh
fi
hC=`getHostColor`

PS1='`_return_code`${uC}\u@${eC}${hC}\h${eC}:${pC}\w${eC} `_git_info`\$ ' # Acceptable

_git_info() {
    git rev-parse --is-inside-work-tree &> /dev/null

    if [[ $? == 0 ]]; then
        br_name=$(git branch --show-current)

        # Get number of insertions and deletions
        s=$( git diff --shortstat 2>/dev/null )
        reg='([0-9]) insertion'
        if [[  $s =~ $reg ]]; then
                _insertions="${GREEN}${BASH_REMATCH[1]}${RESET_COLOR}"
        else
                _insertions=""
        fi

        reg='([0-9]) deletion'
        if [[  $s =~ $reg ]]; then
                _deletions="${RED}${BASH_REMATCH[1]}${RESET_COLOR}"
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

good_status=$LIGHT_GREY
bad_status=$RED
_return_code() {
        code=$?
        if [[ $code == 0 ]]; then
                printf "${good_status}0${RESET_COLOR} "
        else
                printf "${bad_status}$code${RESET_COLOR} "
        fi
}

# Disable git from using the stupid ask pass gui
unset SSH_ASKPASS

# Custom stuff
PATH=$PATH:~/dotfiles/bins
alias fix_keychron='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode'

if test -f ~/dotfiles/work/workrc.sh ; then
   source ~/dotfiles/work/workrc.sh
fi

export NVM_DIR="$HOME/.nvm"
if [ -d $NVM_DIR ]; then
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
export PATH="$HOME/.local/bin:$PATH"

alias claude-dangerous='claude --dangerously-skip-permissions'
