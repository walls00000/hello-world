#!/bin/bash --
alias vim74='/Applications/MacVim.app/Contents/MacOS/Vim'
alias iterm='/Applications/iTerm.app/Contents/MacOS/iTerm'
export EDITOR="vim"
export GIT_EDITOR="vim"
export GRAPHDIR=`puppet config print graphdir`
export SANDBOX="${HOME}/sandbox"
export PUPPET="${SANDBOX}/puppet1"

alias ls="ls -G"
alias ovftool='/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool'
alias flushdns='sudo killall -HUP mDNSResponder; sleep 1; dscacheutil -flushcache'
alias cow='fortune | cowsay'
alias grep='grep --color'


if [ -f ~/.git_alias ];then
  source ~/.git_alias
fi

source ${HOME}/functions.sh

xssh() {
  for host in $@
  do
  	echo "Connecting to ${host}"
    xterm -fg yellow -bg black -e ssh ${host} &
  done
}

vssh() {
  for host in $@
  do
  	echo "Connecting to ${host}"
    xterm -fg yellow -bg NavyBlue -e vagrant ssh ${host} &
  done
}

xvim() {
  for i in $@
  do
    xterm -rv -e vim $i &
  done
}

fif() {
  options="-l"
  if [ "X${show_in_file}" = "Xtrue" ];then
    options=""
  fi
  if [ -z $1 ];then
    red "Please provide a directory to start in"
    echo "usage fif <dir> <string>"
    return
  fi
  if [ -z $2 ];then
    red "Please provide a string to look for"
    echo "usage fif <dir> <string>"
    return
  fi
  find -L $1 -type f -exec grep ${options} "$2" {} \;
  show_in_file="false"
}

sif() {
  show_in_file=true
fif ${@} 
}

#RVM a ruby version manager
if [ -z ${HOMEBIN} ];then
  export HOMEBIN="${HOME}/bin"
  export PATH=${HOMEBIN}:${PATH}
fi

if [ -z ${RVMBIN} ];then
  export RVMBIN=${HOME}/.rvm/bin
  export PATH="$PATH:${RVMBIN}" # Add RVM to PATH for scripting
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

cow
