" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" You will load your plugins here
" Make sure to use sinle quotes

Plug 'tomtom/tcomment_vim'

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
	noremap <silent <Leader>cc :TComment<CR>



