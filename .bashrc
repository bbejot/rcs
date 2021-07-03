source ~/.bashrc_orig

alias ll="ls -l"
alias la="ls -a"
alias l1="ls -1"

# PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
if [ "$USER" == "root" ]; then
    PS1="[\033[91m\w\033[0m]# "
else
    PS1="[\033[94m\w\033[0m]\$ "
fi

