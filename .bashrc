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


NEWLINE_BEFORE_PROMPT=yes

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

red="\[\e[1;31m\]"
green="\[\e[1;32m\]"
yellow="\[\e[1;33m\]"
blue="\[\e[1;34m\]"
magenta="\[\e[1;35m\]"
cyan="\[\e[1;36m\]"
header="\[\e[1;95m\]"
reset="\[\e[0m\]"
prompt_color="\[\e[1;32m\]"
info_color="\[\e[1;34m\]"
prompt_symbol=👽

if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
    prompt_color="\[\e[1;94m\]"
    info_color="\[\e[1;31m\]"
    prompt_symbol=☠️
fi

PS1="${prompt_color}┌─${VIRTUAL_ENV:+(${reset}$(basename $VIRTUAL_ENV)${prompt_color})}─"
PS1+="[${header}\D{%Y-%m-%d %H:%M:%S}${prompt_color}]─"
PS1+="{${info_color}\u${prompt_symbol}\h${prompt_color}}─"
PS1+="(${yellow}\$? \$([[ \$? == 0 ]] && echo \"${green}\342\234\223\" || echo \"${red}\342\234\227\")${prompt_color})─"
PS1+="(${red}\w "
PS1+="${yellow}\$(ls -1 | wc -l | sed 's: ::g') ${green}files${prompt_color}, ${yellow}\$(ls -sh | head -n1 | sed 's/total //')${prompt_color})\n"
PS1+="└─${cyan}\$(parse_git_branch)${prompt_color}─"
PS1+="${info_color}\$${reset} "
[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"
