if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'

"Plug 'tmhedberg/SimpylFold'

Plug 'christoomey/vim-tmux-navigator'

"Plug 'Vimjas/vim-python-pep8-indent'

"Plug 'vim-syntastic/syntastic'

Plug 'nvie/vim-flake8'

"Plug 'scrooloose/nerdtree'

"Plug 'jistr/vim-nerdtree-tabs'

"Plug 'EinfachToll/DidYouMean'

Plug 'pangloss/vim-javascript'

" Track the engine.
Plug 'SirVer/ultisnips'
"
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

"Plug 'derekwyatt/vim-fswitch'

call plug#end()

set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

nnoremap <space> za

au BufNewFile,BufRead *.py,*html,*css,*js
			\ setlocal tabstop=4 |
			\ setlocal softtabstop=4 |
			\ setlocal shiftwidth=4 |
			\ setlocal textwidth=79 |
			\ setlocal expandtab |
			\ setlocal autoindent |
			\ setlocal fileformat=unix | 

"au BufNewFile,BufRead *.js, *.html, *.css 
"    \ setlocal tabstop=2 |
"    \ setlocal softtabstop=2 |
"    \ setlocal shiftwidth=2 |  

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.js match BadWhitespace /\s\+$/

set encoding=utf-8

set shortmess+=c
"let g:ycm_register_as_syntastic_checker=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_always_populate_location_list=1 "default 0
let g:ycm_collect_identifiers_from_tags_files=1 "default 0

let g:ycm_confirm_extra_conf=1
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command ='same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist ={'*':1}
let g:ycm_key_invoke_completion ='<C-Space>'
let g:ycm_show_diagnostics_ui=1

map <leader>g  :YcmCompleter GoToDefinition<CR>

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] 

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_debug=0
"let g:syntastic_enable_signs = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers=['pylint']
"let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_cpp_checkers = ['gcc','clang']

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"

augroup javascript_folding
	au!
	au FileType javascript setlocal foldmethod=syntax
augroup END

"auto close {
function! s:CloseBracket()
	let line = getline('.')
	if line =~# '^\s*\(struct\|class\|enum\) '
		return "{\<Enter>};\<Esc>O"
	elseif searchpair('(', '', ')', 'bmn', '', line('.'))
		" Probably inside a function call. Close it off.
		return "{\<Enter>});\<Esc>O"
	else
		return "{\<Enter>}\<Esc>O"
	endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

set nu

set exrc
set secure

set clipboard=unnamed

