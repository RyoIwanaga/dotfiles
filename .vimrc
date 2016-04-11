""" Initialize"{{{

set t_Co=256
set background=dark
"let g:hybrid_use_Xresorces = 1
"colorscheme hybrid
syntax on

"}}}
""" Encoding"{{{

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

"}}}
""" Syntax {{{

autocmd FileType scheme :let is_gauche=1
autocmd FileType scheme :nnoremap <F5> :w<CR>:!gosh -l %:p<CR>

" filetypes
autocmd BufRead,BufNewFile *.asd set filetype=lisp
autocmd BufRead,BufNewFile *.cl set filetype=lisp

"}}}
""" Plugin"{{{

" NeoBundle {{{

set nocompatible               " be iMproved
filetype plugin indent off     " required!
set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Neocomplcache
NeoBundle 'Shougo/neocomplcache.vim'

" Color scheme: molokai
NeoBundle 'tomasr/molokai'

" Slimv
NeoBundle 'vim-scripts/slimv.vim'

call neobundle#end()

" required!
filetype plugin indent on      

"}}}
colorscheme molokai
" Slimv {{{

let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_impl = 'sbcl'
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/bundle/slimv.vim/slime/start-swank.lisp &'

"}}}
" Neocomplcache {{{

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
"}}}
""" Option"{{{

"" System"{{{

set cursorline
set mouse=a
set modeline
set nobackup
set number
set numberwidth=4
set showcmd
set ruler
set showmatch
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set tabstop=4
set shiftwidth=4
" 80 + numberwidth(=4) + foldcolumn(=3) XXX
set columns=87

"}}}

"" Tab and pages"{{{

set tabpagemax=20
set showtabline=2

"}}}

"" Folding"{{{

set foldenable
set foldcolumn=4
set foldmethod=marker
autocmd FileType c set commentstring=//%s

"}}}

"" Search"{{{

set incsearch
set smartcase

"}}}

set clipboard=unnamed,autoselect

set grepprg=internal	" Allow to use 'vimgrep' automatically

"}}}
""" Key mappings"{{{

"" Define prefix key"{{{

nnoremap    [Tag_Tab]   <Nop>

nnoremap	[SplitWin]	<Nop>
nmap		t		[Tag_Tab]
nmap		s		[SplitWin]
"}}}

"" Tag and searches"{{{
nnoremap	[Tag_Tab]t	<C-]>
" list
nnoremap	[Tag_Tab]j	:<C-u>tjump<CR>
nnoremap	[Tag_Tab]n	:<C-u>tag<CR>
nnoremap	[Tag_Tab]p	:<C-u>pop<CR>
nnoremap	[Tag_Tab]T	:<C-u>tags<CR>
"}}}

"" Tab pages"{{{

"" anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
"    let title = '[' . title . ']'
    let title = title
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

nnoremap	[Tag_Tab]o	:tabedit<Space>
nnoremap	[Tag_Tab]l	:tabnext<CR>
nnoremap	[Tag_Tab]h	:tabprevious<CR>
nnoremap	[Tag_Tab]q	:tabclose<CR>
nnoremap	[Tag_Tab]m	:tabmove<CR>
for n in range(1, 9) 
  execute 'nnoremap <silent> [Tag_Tab]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

"}}}

"" Split windows"{{{
nnoremap	[SplitWin]h <C-w>h
nnoremap	[SplitWin]l <C-w>l
nnoremap	[SplitWin]k <C-w>k
nnoremap	[SplitWin]j <C-w>j
nnoremap	[SplitWin]H <C-w>H
nnoremap	[SplitWin]L <C-w>L
nnoremap	[SplitWin]K <C-w>K
nnoremap	[SplitWin]J <C-w>J
"}}}

"" Folding"{{{
" Open fold
" nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" Close fold
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo' : 'l'
nnoremap	zz	za
vnoremap	zz	zf
" }}}

"" Grep
nnoremap gn	:cnext<CR>
nnoremap gp	:cprev<CR>
"open error window
nnoremap ge	:copen<CR> 

"" Ex command"{{{
"nnoremap ; :
"nnoremap : ;
"}}}

" Esc
imap <C-j> <Esc>

" Esc
imap <C-j> <Esc>
" Insert BR without change mode to i_
nnoremap 	o o<Esc>
nnoremap 	O O<Esc>

" Select All line
nnoremap <Space>a ggVG

" Indent all line
nnoremap == ggVG=gg

"" Access Option files instantry and read option.
nnoremap <Space>s :<C-u>source %<CR>
nnoremap <Space>.. :<C-u>0tabedit $MYVIMRC<CR>
nnoremap <Space>.v :<C-u>0tabedit ~/.vimperatorrc<CR>
nnoremap <Space>.z :<C-u>0tabedit ~/.zshrc<CR>
nnoremap <Space>.f :<C-u>0tabedit ~/.vim/ftplugin/<CR>

nnoremap <Space>.cc :<C-u>0tabedit ~/.vim/ftplugin/c.vim<CR>
nnoremap <Space>.cp :<C-u>0tabedit ~/.vim/ftplugin/cpp.vim<CR>
nnoremap <Space>.cl :<C-u>0tabedit ~/.vim/ftplugin/cl.vim<CR>
nnoremap <Space>.l :<C-u>0tabedit ~/.vim/ftplugin/lisp.vim<CR>
nnoremap <Space>.p :<C-u>0tabedit ~/.vim/ftplugin/python.vim<CR>
nnoremap <Space>.j :<C-u>0tabedit ~/.vim/ftplugin/java.vim<CR>
nnoremap <Space>.t :<C-u>0tabedit ~/.vim/ftplugin/tex.vim<CR>

" Open memo 
nnoremap <Space>m :<C-u>0tabedit ~/MEMO<CR>

" Toggle spell check mode
nnoremap spell :<C-u>set spell!<CR>

" Access help file
nnoremap <C-h> :<C-u>help<Space>

nnoremap <F7> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" toggle hl search
nnoremap <Space>h :<C-u>set hlsearch!<CR>

"}}}
""" Commands"{{{

" Rename current file.
command! -nargs=1 -complete=file Rename 
			\ file <args> | call delete(expand('#'))

" Change directory to same directory editing file.
command! -nargs=? -complete=dir -bang CD 
			\ call s:ChangeCurrentDir('<args>', '<bang>')

" Useful grep
command! -nargs=+ -complete=file Grep call s:Grep([<f-args>])

"}}}
""" Function"{{{

function! s:ChangeCurrentDir(directory, bang)"{{{
	if a:directory == ''
		lcd %:p:h
	else
		execute 'lcd' . a:directory
	endif

	if a:bang == ''
		pwd
	endif
endfunction"}}}

function! s:Grep(args)"{{{
	execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction"}}}

function! Lstrip(str)
	return substitute(a:str, '\v^\s+', '', '')
endfunction
function! Rstrip(str)
	return substitute(a:str, '\v\s+$', '', '')
endfunction
function! Strip(str)
	let temp = substitute(a:str, '\v^\s+', '', '')
	return substitute(temp, '\v\s+$', '', '')
endfunction
"}}}

""" Template {{{
autocmd BufNewFile Makefile 0r $HOME/.vim/template/Makefile
"}}}



" vim: commentstring="%s
