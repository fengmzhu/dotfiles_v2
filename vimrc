" Leader"{{{
	let mapleader = "\<Space>"
	let g:mapleader = "\<Space>"
"}}}
" Vundle "{{{
	" Vundle setup"{{{
		set nocompatible
		filetype off
		set rtp+=~/.vim/vundle/Vundle.vim
		call vundle#begin()

		Plugin 'VundleVim/Vundle.vim'

		Plugin 'https://github.com/mbbill/undotree.git'
		Plugin 'https://github.com/junegunn/vim-easy-align.git'
		Plugin 'https://github.com/vimwiki/vimwiki.git'
		Plugin 'https://github.com/scrooloose/nerdtree.git'
		Plugin 'https://github.com/vim-scripts/mru.vim.git'
		Plugin 'https://github.com/vim-airline/vim-airline.git'
		Plugin 'https://github.com/vim-airline/vim-airline-themes.git'

		call vundle#end()
		filetype plugin indent on
		"use :PluginInstall to install Vundle plugins
	"}}}
	" Plugin setting"{{{
		"Nerd tree"{{{
			map <leader>nn :NERDTreeToggle<cr>
			map <leader>nb :NERDTreeFromBookmark
			map <leader>nf :NERDTreeFind<cr>
			let NERDTreeShowBookmarks=1
		"}}}
		" EasyAlign"{{{
			xmap ga <Plug>(EasyAlign)
			nmap ga <Plug>(EasyAlign)
		"}}}
		" undo-tree"{{{
			if has("persistent_undo")
				set undodir=~/.undodir/
				set undofile
				if !isdirectory(expand(&undodir))
				    call mkdir(expand(&undodir), "p")
				endif
			endif
			map <leader><leader>u :UndotreeToggle<cr>
		"}}}
		"vimwiki"{{{
			let g:vimwiki_folding='syntax'
		"}}}
		" airline"{{{
			let g:airline_theme='molokai'
			let g:airline#extensions#tabline#enabled = 1
		"}}}
	"}}}
"}}}
" Configuration"{{{
	" Encoding"{{{
		set encoding=utf-8
		scriptencoding utf-8 "must be after 'set encoding=utf-8'
	"}}}
	" Wildmenu Setting {{{
		set wildmenu
		set wildignore+=.hg,.git,.svn                    " Version control
		set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
		set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
		set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
		set wildignore+=*.sw?                            " Vim swap files
		set wildignore+=*.DS_Store                       " OSX bullshit
	" }}}
	" Appearances Setting"{{{
		set ruler
		set term=screen-256color
		set list listchars=tab:› ,extends:>,precedes:<,eol:¬
		set number
		set cursorline
		set cmdheight=2
		set nowrap
		set foldcolumn=1        " Add a bit extra margin to the left
	"}}}
	" Appearances Color Scheme"{{{
		syntax on    " Enable syntax highlighting
		colo molokai " color scheme
		let g:molokai_original = 1
		hi Visual term=reverse cterm=reverse guibg=Grey
		hi MatchParen cterm=bold ctermbg=magenta ctermfg=white
	"}}}
	" Sound "{{{
		set noerrorbells
		set novisualbell
		set t_vb=
	"}}}
	" MISC "{{{
		set history=500
		set path+=**
		set hlsearch            " Highlight search results
		set incsearch           " Makes search act like search in modern browsers
		set lazyredraw          " Don't redraw while executing macros (good performance config)
		set noswapfile
		set mouse=a
		set autochdir
		set clipboard=unnamed
		set foldmethod=marker
		set showmatch
		set ai                  " Auto indent
		set viminfo^=%          " Remember info about open buffers on close
		set tm=500
		set so=6                " Set 7 lines to the cursor - when moving vertically using j/k
		map 0 ^
	"}}}
	" Status line"{{{
		set laststatus=2 " Always show the status line
		set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c " Format the status line
	"}}}
	" Special"{{{
		" Return to last edit position when opening files (You want this!)
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	"}}}
"}}}
" Hot Key"{{{
	" Save file "{{{
		nmap <leader>q :q<cr>
		nmap <leader>qq :q!<cr>
		nmap <leader>qa :qa<cr>
		nmap <leader>qaa :qa!<cr>
		nmap <leader>w :w!<cr>
		nmap <leader>wq :wq!<cr>
	"}}}
	" Autocomplete"{{{
		imap ;; <c-x><c-p>
	"}}}
	" Pane resizing"{{{
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
	" Buffer switching"{{{
		map <leader>bn :bnext<cr>
		map <leader>bp :bprevious<cr>
		map <leader>bl :bnext<cr>
		map <leader>bh :bprevious<cr>
	"}}}
	" Tab switching"{{{
		map <leader>tn :tabnew<cr>
		map <leader>to :tabonly<cr>
		map <leader>tc :tabclose<cr>
		map <leader>tm :tabmove
		map <leader>tl :tabnext<cr>
		map <leader>th :tabprevious<cr>
		map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
		" Let 'tj' toggle between this and the last accessed tab"{{{
			let g:lasttab = 1
			nmap <Leader>tj :exe "tabn ".g:lasttab<CR>
			au TabLeave * let g:lasttab = tabpagenr()
		"}}}
		" Open a new tab with the current buffer's path"{{{
			map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
		"}}}
	"}}}
	" Spell checking "{{{
		map <leader>ss :setlocal spell!<cr>
		map <leader>sn ]s
		map <leader>sp [s
		map <leader>sa zg
		map <leader>s? z=
	"}}}
	"Customization"{{{
		nnoremap <leader>d :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<ESC>0=j
		nnoremap <leader>vt  :vs ~/vimwiki/tmp.wiki<CR>
		nnoremap <leader>vw  :vs ~/vimwiki/index.wiki<CR>
		nnoremap <leader>ev  :vs ~/.vimrc<CR>
	"}}}
"}}}
" Helper Functions "{{{
	" Delete trailing white space on save "{{{
		func! DeleteTrailingWS()
			exe "normal mz"
			%s/\s\+$//ge
			exe "normal `z"
		endfunc
		autocmd BufWrite * :call DeleteTrailingWS()
	"}}}
	" HasPaste()"{{{
		function! HasPaste()
			if &paste
				return 'PASTE MODE  '
			endif
			return ''
		endfunction
	"}}}
""}}}
