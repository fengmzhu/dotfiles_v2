alias setenv="export"

alias vi='vim'
alias gs='git status'
alias ls="ls --color=always"
alias ll='ls -alh'
alias l='ls'
alias sl='ls'
alias s='ls'

alias vimrc='vim ~/.vimrc'
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bash_aliases'

alias bs='. ~/.bashrc'

alias h='history'
alias c="clear"

if [ -f ~/.bash_aliases.private ]; then
	. ~/.bash_aliases.private
fi
