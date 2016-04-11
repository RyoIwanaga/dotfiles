setl path=.,/usr/include/,,/usr/include/gtk-2.0/
setl commentstring=//%s
setl cinoptions+=:0,g0

""" Folding

setl foldmethod=syntax
setl foldlevelstart=2
setl foldnestmax=2
setl hlsearch
"let c_no_comment_fold = 1

""" Command

" Compile current file
nnoremap <F3> :!./a.out<CR>
nnoremap <F4> :w<CR>:!g++ -std=gnu++11 %<CR>
nnoremap <F5> :w<CR>:make<CR>
nnoremap <F6> :w<CR>:make<CR>:!!<CR>

nnoremap <F9> i#ifndef<Space><CR>#define<Space><CR>#endif



"inoremap <expr> { Brace()
inoremap { {<CR><CR>}<Esc>kA<tab>
"inoremap { {}<Esc>i

function! Brace()
	let line = strpart(getline('.'), 0, col('.') - 1)
	if line =~ ') \=$'
    	return "\n{\n}\<Esc>0bo"
  	else
		return "{"
		" was 
		" return "{}\<Left>"
  	endif
endfunction
