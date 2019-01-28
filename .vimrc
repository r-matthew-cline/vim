" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" You will load your plugins here
" Make sure to use sinle quotes

Plug 'tomtom/tcomment_vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

" Create leader key to be used in key configs
let mapleader = ','

" netrw configs

	" absolute width of netrw window
	let g:netrw_winsize = -28

	" tree-view
	let g:netrw_liststyle = 3

	" sort is affecting only: directories on the top, files below
	let g:netrw_sort_sequence = '[\/]$,*'

	" open file in a new tab
	let g:netrw_browse_split = 3

" tcomment configs

	" Leader C is the prefix for code related mappings
	noremap <silent> <Leader>cc :TComment<CR>

" ctrlp configs

	" Leader F is for file related mappings
	nnoremap <silent> <Leader>f :CtrlP<CR>
	nnoremap <silent> <Leader>fm :CtrlPMRU<CR>

	" Leader b is for buffer related mappings
	nnoremap <silent> <Leader>b :CtrlPBuffer<CR> "cycle between buffer
	nnoremap <silent> <Leader>bb :bn<CR> "create new buffer
	nnoremap <silent> <Leader>bd :bdelete<CR> "delete the current buffer
	nnoremap <silent> <Leader>bu :bunload<CR> "unload the current buffer
	nnoremap <silent> <Leader>bl :setnomodifiable<CR> "lock the current buffer

" lightline configs
	
	" Ensure status line always visible
	set laststatus=2

	" Remove vim mode information line, as it is displayed in the status
	" line
	set noshowmode

" General configs

	" Show line numbers
	set number

	" Reload .vimrc using ',v'
	map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
