" perl.vim
if exists('b:did_ftplugin_perl')
  finish
endif
let b:did_ftplugin_perl = 1

setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" perltidy
if executable('perltidy')
  map ,pt <ESC>:%!perltidy<cr><C-o>
  map ,ptv <ESC>:'<,'>! perltidy<cr>
endif

