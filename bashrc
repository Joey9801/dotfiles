export EDITOR="vim"

#Vim typos (make them far too much..)
alias vi=vim
alias cim=vim

alias l=ls

alias dua='du -h -a --max-depth=0'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'

alias ccat='pygmentize -g'
alias fuck='sudo $(history -p \!\!)'

#Allow escape codes through less by default
alias less='less -R'

export LIBVIRT_DEFAULT_URI="qemu:///system"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
