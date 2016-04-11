""" Option
setl lisp
setl lispwords=
setl lispwords+=define,define-syntax,lambda,let,let*,let1,if,syntax-rules

setl showmatch
setl commentstring=;%s
setl path=.,/usr/local/share/gauche/0.9/lib/,/usr/local/share/gauche/site/lib

""" Key mappings

nnoremap <F8>   :%s/nil/'()/g<CR>
nnoremap <F10>  <Space>=

" Insert
nnoremap <F2> i#! /usr/bin/env gosh<CR><Esc>:w<CR>:!chmod +x %<CR>

" Do 'chmod +x ' and run
nnoremap <F3> :w<CR>:!gosh %<Space>
nnoremap <F4> :w<CR>:!gosh<CR>
nnoremap <F5> :w<CR>:!gosh -l %:p<CR>

" imap ( ()<Left>
