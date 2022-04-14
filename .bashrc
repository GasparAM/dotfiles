#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Fix left-right arrows
#bindkey "\e[1;5D" backward-word
#bindkey "\e[1;5C" forward-word

#exports
export XDG_CONFIG_HOME="$HOME/.config/"
#export TERM='xterm-256color'

#archive extraction tool
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#custom aliases
alias la="ls -lah --color=auto"


#colorscripts
colorscript -r

#Rust stuff
#. "$HOME/.cargo/env"

export PATH=$PATH:/home/gaspar/.spicetify
alias gitdot='/usr/bin/git --git-dir=/home/gaspar/dotfiles/ --work-tree=/home/gaspar'
