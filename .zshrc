# 試行錯誤中

# alias

alias df="df -h"
alias du="du -h"

case "${OSTYPE}" in
freebsd*|darwin*)
	alias ls="ls -G -w"
	;;

linux*)
	alias ls="ls --color"
	;;
esac

# LANG

export LANG=ja_JP.UTF-8

# looks

case ${UID} in
0)
	PROMPT="%B%{[31m%}%/#%{[m%}%b "
	PROMPT2="%B%{[31m%}%_#%{[m%}%b "
	SPROMPT="%B%{[31m%}%r is correct? [n,y,a,n]:%{[m%}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}$HOST%%.*} ${PROMPT}"
	;;

*)
	PROMPT="%{[31m%}%/%%%{[m%} "
	PROMPT2="%{[31m%}%_%%%{[m%} "
	SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "

	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
esac

# completion

autoload -U compinit
compinit
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' 

# terminal's title

case "${TERM}" in
kterm*|xterm)
	precmd(){
	    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
	;;
esac

# command history

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups   # ignore duplication command history list
setopt share_history      # share command history data

# key bind

#bindkey -v  # vim like
bindkey -e  # emacs like

# history search

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# auto cd

setopt auto_cd

# auto pushd

setopt auto_pushd

# auto correct

setopt correct

# list_packed

setopt list_packed

# no sound

setopt nolistbeep

# predict on

autoload predict-on
predict-on

# multios

setopt multios

# ls color

export LSCOLORS=exfxcxdxbxegedabagacad

export LS_COLORS='di=34:ln:35:sp=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# test setting file

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
