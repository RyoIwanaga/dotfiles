""" options

setl commentstring=;%s
setl showmatch
setl lispwords+=while,do-list,block,defsystem,let1
"setl hlsearch

"" tabs

setl expandtab
setl tabstop=2
setl shiftwidth=2

"" folding 

setl foldminlines=1
"setl foldnestmax=1
setl foldcolumn=2

" setl foldmethod=indent
setl foldmethod=expr 
setl foldexpr=MyCommonLispFold(v:lnum)
setl foldtext=MyCommonLispFoldText()

""" key Mappings

nnoremap <C-I> v%di()<Esc>hp%i

" delete (S ...)
nnoremap ds df(<CR>%x%
nnoremap da d%hx
nnoremap d1 v%p/)<CR>v%p

"nnoremap <F3> :!sbcl<CR>
nnoremap <F9> :w<CR>:!sbcl --load %<CR>
nnoremap <F3> <Esc>:!clisp<CR>
nnoremap <F5> <Esc>:w<CR>:!clisp -i %<CR>
nnoremap <space><space> <Esc>:0tabedit ~/cl/module/my.lisp<CR>

""" functions

function! MyCommonLispFold(lnum)
    " Determine folding level in Common Lisp source
    "
	let cur_level = foldlevel(a:lnum)
    let this_line = getline(a:lnum)

	print cur_level

	if match(this_line, '^$') >= 0
		return 0
	elseif this_line =~ '\v^\((defun|defmacro|defmethod)'
		return ">1"
	else
		return "="
	endif
endfunction

function! MyCommonLispFoldText()
	" Display Fold Text
	"
	
	""" current line

	let cl = getline(v:foldstart)
	let cl_bracket_pos = match(cl, '\v\(')
	" Remove first '('
	let cl_result = Rstrip(
				\ strpart(cl, 0, cl_bracket_pos) .
				\ strpart(cl, cl_bracket_pos + 1))

	""" next line

	let nl = getline(v:foldstart + 1)

	" When function has comment string.
	" \v is very magic option for regexp
	if nl =~ '\v^\s*"'
		let nl_strip = Strip(nl)
		let leng = len(nl_strip)

		" Remove first and last (
		if nl_strip[leng - 1] =~ '"'
			let nl_result = strpart(nl_strip, 1, leng - 2)

		" Remove only first (
		else		
			let nl_result = strpart(nl_strip, 1)

		endif

		return cl_result . ": " . nl_result

	else
		return cl_result . ": "

	endif
endfunction
