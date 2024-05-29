# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

set -o emacs
set -o posix
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

HAVE_COLORS=no
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    case "$TERM" in
        xterm-color|*-256color) HAVE_COLORS=yes;;
    esac
    HAVE_COLORS=yes
fi

if [ "$HAVE_COLORS" == "yes" ]; then
    COLOR_FLAG="--color=auto"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function append_path {
  item=$1
  if [[ ":${PATH}:" =~ ":${item}:" ]]; then
    return
  fi
  export PATH="${PATH:+${PATH}:}${item}"
}

function prepend_path {
  item=$1
  if [[ ":${PATH}:" =~ ":${item}:" ]]; then
    return
  fi
  export PATH="${item}${PATH:+:${PATH}}"
}

prepend_path "$HOME/bin"
prepend_path "$HOME/.local/bin"

alias grep="grep $COLOR_FLAG"
alias ll="ls -al $COLOR_FLAG"
alias la="ls -a $COLOR_FLAG"
alias l1="ls -1 $COLOR_FLAG"

if [ "$HOSTNAME" == "ip-172-31-0-74.us-east-2.compute.internal" ]; then
  machine="ec2"
elif [ "$HOSTNAME" == "DESKTOP-APB1VEQ" ]; then
  machine="desktop"
elif [ "$HOSTNAME" == "LAPTOP-BGO3JQ1U" ]; then
  machine="laptop"
else
  machine="unknown"
fi

if [ "$USER" == "root" ]; then
    usermark="#"
else
    usermark="\$"
fi

if [ "$HAVE_COLORS" == "yes" ]; then
  PS1="[${machine} \[\033[94m\]\w\[\033[0m\]]${usermark} "
else
  PS1="[${machine} \w]${usermark} "
fi

append_path "${HOME}/workspace/bin"

alias gow="cd $HOME/workspace"
alias gotmp="cd $HOME/workspace/tmp"

alias d.="du -h --max-depth 1 ."

alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."
alias cd.....="cd ../../../../.."
alias cd......="cd ../../../../../.."
alias cd.......="cd ../../../../../../.."
alias cd........="cd ../../../../../../../.."
alias cd.........="cd ../../../../../../../../.."
alias cd..........="cd ../../../../../../../../../.."

alias notify="python -c \"import sys, time; playlist=[0,1,3,5,7,9,11,12]; [(print('\x07' if i in playlist else '', end=''), time.sleep(.15), sys.stdout.flush) for i in range(max(playlist)+1)]\""

function col {
    awk "{ print \$$1 }"
}

export TMUX_COLOR=green

export CARGO_ROOT="$HOME/.cargo"
if [ -e $CARGO_ROOT/env ]; then
  . "$CARGO_ROOT/env"
fi

export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  prepend_path "$PYENV_ROOT/bin"
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GO_ROOT="/usr/local/go"
append_path "${GO_ROOT}/bin"

export juke_prod="bot.0p71x.com"
alias go-juke-prod="ssh juke@$juke_prod -p 8122"
# boo on defrost cram
alias go-juke-prod-bbejot="ssh bbejot@$juke_prod -p 8122"
# H..22

export rpi_ip=172.16.0.201
alias go-rpi="ssh bxb@$rpi_ip"

