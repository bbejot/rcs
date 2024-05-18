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
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ "$USER" == "root" ]; then
    usermark="#"
else
    usermark="\$"
fi
color_prompt=no
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" == "yes" ]; then
  PS1="[\[\033[94m\]\w\[\033[0m\]]${usermark} "
else
  PS1="[\w]${usermark} "
fi

export PATH="${PATH:+${PATH}:}${HOME}/workspace/bin"

alias gow="cd $HOME/workspace"

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

if [ -e $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

. "$HOME/.cargo/env"
