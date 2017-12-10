"Vundle "{{{
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	"Plugin 'git://git.wincent.com/command-t.git'

	call vundle#end()
	filetype plugin indent on
"}}}
" Leader"{{{
	let mapleader = "\<Space>"
	let g:mapleader = "\<Space>"
"}}}
" Fast saving"{{{
	nmap <leader>q :q<cr>
	nmap <leader>qq :q!<cr>
	nmap <leader>qa :qa<cr>
	nmap <leader>qaa :qa!<cr>
	nmap <leader>w :w!<cr>
	nmap <leader>wq :wq!<cr>
"}}}
" Syntax & coloring"{{{
	syntax on    " Enable syntax highlighting
	colo molokai " color scheme
	let g:molokai_original = 1
	hi Visual term=reverse cterm=reverse guibg=Grey
"}}}
" Pane switching"{{{
	if exists('$TMUX')
		function! TmuxOrSplitSwitch(wincmd, tmuxdir)
			let previous_winnr = winnr()
			silent! execute "wincmd " . a:wincmd
			if previous_winnr == winnr()
				call system("tmux select-pane -" . a:tmuxdir)
				redraw!
			endif
		endfunction

		let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
		let &t_ti = "\<Esc>]2;vim\<Esc>\\" .  &t_ti
		let &t_te = "\<Esc>]2;".  previous_title . "\<Esc>\\" . &t_te

		nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
		nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
		nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
		nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
	else
		nnoremap <C-h> <C-w>h
		nnoremap <C-j> <C-w>j
		nnoremap <C-k> <C-w>k
		nnoremap <C-l> <C-w>l
	endif
"}}}
set foldmethod=marker
"hotkey
imap ;; <c-x><c-p>
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Change window size"{{{
nnoremap <leader>j :resize +5<cr>
nnoremap <leader>k :resize -5<cr>
nnoremap <leader>h :vertical resize -5<cr>
nnoremap <leader>l :vertical resize +5<cr>

nnoremap <leader>jj :resize +15<cr>
nnoremap <leader>kk :resize -15<cr>
nnoremap <leader>hh :vertical resize -25<cr>
nnoremap <leader>ll :vertical resize +25<cr>

nnoremap <leader>jjj :resize +100<cr>
nnoremap <leader>kkk :resize -100<cr>
nnoremap <leader>hhh :vertical resize -100<cr>
nnoremap <leader>lll :vertical resize +100<cr>
"}}}
hi MatchParen cterm=bold ctermbg=magenta ctermfg=white 
