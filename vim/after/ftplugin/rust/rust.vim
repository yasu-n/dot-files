" rust.vim
if exists('b:did_ftplugin_rust')
  finish
endif
let b:did_ftplugin_rust = 1

packadd rust.vim
packadd termdebug

let g:termdebugger = "rust-gdb"

nnoremap <space>f <ESC>:RustFmt<CR>
vnoremap <space>f <ESC>:RustFmtRange<CR>
nnoremap <Space>m <ESC>:execute('OpenBrowser ' . substitute(execute('1messages'), 'Done: ', '', "g"))<CR>
