nnoremap <F5> <Esc>:w<CR>:!javac %<CR>

setl include=^import

setl foldmethod=expr
setl foldexpr=

setl foldnestmax=2


setl foldexpr=MyCommonLispFold(v:lnum)
"setl foldtext=MyCommonLispFoldText()

function! MyCommonLispFold(lnum)
    " Determine folding level in Common Lisp source
    "
	let cur_level = foldlevel(a:lnum)
    let this_line = getline(a:lnum)
    let indent = indent(a:lnum)
	print indent

	print cur_level

	if this_line =~ '\v^}'
		return 0
	elseif indent = 1
		return ">1"
	else
		return "="
	endif
endfunction


hoge
