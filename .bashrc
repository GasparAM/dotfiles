#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Fix left-right arrows
#bindkey "\e[1;5D" backward-word
#bindkey "\e[1;5C" forward-word

#exports
export XDG_CONFIG_HOME="$HOME/.config/"
#export TERM='xterm-256color'
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
export EDITOR=nvim

#archive extraction tool
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1   ;;
      *.tar.gz)    tar xzvf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xjvf $1   ;;
      *.tgz)       tar xzvf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z xv $1      ;;
      *.deb)       ar xv $1      ;;
      *.tar.xz)    tar xvf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#custom aliases
alias la="ls -lah --color=auto"
alias pac="sudo pacman"
alias xcp="xclip -selection clipboard"
alias ls='ls --color=auto -A'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

#colorscripts
colorscript -r

#Rust stuff
#. "$HOME/.cargo/env"

export PATH=$PATH:/home/${USER}/.spicetify
alias gitdot='/usr/bin/git --git-dir=/home/${USER}/dotfiles/ --work-tree=/home/${USER}'
#alias vim=nvim

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "${BRANCH}${STAT}"
	else
		echo ""
	fi
}

export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 2)\]\`parse_git_branch\`🦧\[$(tput setaf 5)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

export PATH=$PATH:/home/gavetisyan/.spicetify

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias gpu="git push -u origin $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
