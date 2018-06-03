alias setenv="export"

alias vim="mvim -v"
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
alias ct="cd ~/Documents/writing/theories"
alias vsv="vim ~/.vim/syntax/systemverilog.vim"


alias docker_rmall='docker rm $(docker ps -a -q);docker rmi $(docker images -q); docker rmi $(docker images --filter "dangling=true" -q --no-trunc) -f'

if [ -f ~/.bash_aliases.private ]; then
	. ~/.bash_aliases.private
fi
