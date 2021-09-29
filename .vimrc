" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" You will load your plugins here
" Make sure to use sinle quotes

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'OrangeT/vim-csharp'
Plug 'pearofducks/ansible-vim'
Plug 'maksimr/vim-jsbeautify'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" Indentation
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" Create leader key to be used in key configs
let mapleader = ','

" nerdtree configs

	"Show hidden files
	let NERDTreeShowHidden=1

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
	nnoremap <silent> <Leader>e :NERDTreeToggle<CR>

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

	" Lightline ALE integration settings
	let g:lightline = {}
	let g:lightline.component_expand = {
		\ 'linter_checking': 'lightline#ale#checking',
		\ 'linter_warnings': 'lightline#ale#warnings',
		\ 'linter_errors': 'lightline#ale#errors',
		\ 'linter_ok': 'lightline#ale#ok',
		\ }
	let g:lightline.component_type = {
		\ 'linter_checking': 'left',
		\ 'linter_warnings': 'warning',
		\ 'linter_errors': 'errors',
		\ 'linter_ok': 'left',
		\ }
	let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }


" OmniSharp configs
	
	" OmniSharp Highlighting
	let g:OmniSharp_highlight_types = 2

	" Use stdio roslyn server
	let g:OmniSharp_server_stdio = 1
	
	" For using on tty terminal
	let g:OmniSharp_selector_ui = ''

" ALE configs

	" Status Line Function
	function! LinterStatus() abort
		let l:counts = ale#statusline#Count(bufnr(''))
		let l:all_errors = l:counts.error + 1:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors
		return l:counts.total == 0 ? 'OK' : printf(
					\ '%dW %dE',
					\ all_non_errors,
					\ all_errors
					\)
	endfunction

	set statusline=%{LinterStatus()}

	" Linters
	let g:ale_linters = { 'cs': ['OmniSharp'] }

	" Error Output Settings
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echomsg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

	" Show line numbers
	set number

	" Reload .vimrc using ',v'
	map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

	" Remap switching windows when in split mode
	:nnoremap <Leader>w <C-w>

" Format JSON
	map <Leader>pj :%!python -m json.tool<CR>

" Remap the escape key
   	inoremap jj <esc>
	nnoremap q <esc>
	xnoremap q <esc>

" YAML spacing
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" YouCompleteMe configs
let g:ycm_auto_hover = 'CursorHold'
nmap <leader>D <plug>(YCMHover)
