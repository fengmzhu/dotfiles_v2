alias setenv="export"

if [ -f /usr/local/bin/mvim ]; then
	echo "mvim found"
	alias vim="mvim -v"
fi
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
alias ctags="`brew --prefix`/bin/ctags"
alias ctags_sysverilog_here="ctags --languages=systemverilog -R ."

#alias edit='docker run -ti --rm -v $(pwd):/home/developer/workspace jare/vim-bundle'
alias edit='docker run -ti --rm -v $(pwd):/home/developer/workspace feng_vim'




alias docker_rmall='docker rm $(docker ps -a -q) -f;docker rmi $(docker images -q) -f; docker rmi $(docker images --filter "dangling=true" -q --no-trunc) -f'

if [ -f ~/.bash_aliases.private ]; then
	. ~/.bash_aliases.private
fi
