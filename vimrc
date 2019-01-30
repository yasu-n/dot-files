" ~/.vimrc
" maintainer: yasu-n<yasun.pl@gmail.com>
"
" text object {{{
" d: delete
" y: yank
" c: cut and insert mode
"
" old text          command    new text
" "Hello |world"    di"        ""
" 'Hello |world'    di'        ''
" (123+4|56)/2      di(        ()/2
" {12i+|4i56}/2     di{        {}/2
" <div>You</div>    dit        <div></div>
" Hello wor|ld      diw        Hello
" }}}
"
" folding {{{
" command
" zo   : Open one fold under the cursor
" zO   : Open all folds under the cursor recursively
" zc   : Close one fold under the cursor
" zC   : Close all folds under the cursor recursively
" zR   : Open all folds
" zM   : Close all folds
" }}}
"
" terminal {{{
" ex) termkey: Ctrl + w
" termkey Ctrl+w : change window (Ctrl+w is j,h,k.l)
" termkey :      : transfer ex-mode
" termkey :quit  : close window (Can't execute while running job)
" termkey Ctrl+c : stop job
" }}}
filetype plugin indent on
syntax enable

" settings {{{
set fileformat=unix
set fileformats=unix,dos,mac
set backspace=indent,eol,start
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set smarttab
set ambiwidth=double
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set shortmess+=l
set incsearch
set splitright
set noequalalways
set completeopt=menu,preview
set switchbuf=useopen
set wildmode=list:longest
set diffopt+=vertical
set matchpairs+=<:>
set hidden
set imdisable
set ignorecase
set modeline
set directory-=.
set showcmd
set showmatch
set pumheight=15
set previewheight=5
set grepprg=grep\ -nH
set nobackup
set laststatus=2
set cmdheight=3
set ttyfast
" }}}


" hilight {{{
hi LineNr ctermfg=darkgray
hi comment ctermfg=darkgray
hi Search ctermfg=black ctermbg=white term=underline
hi TabLineFill gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Pmenu ctermfg=white ctermbg=darkgray
hi PmenuSel ctermfg=white ctermbg=blue
hi PmenuSbar ctermfg=lightgray
hi PmenuThumb ctermfg=lightgray
" }}}

" autocmd {{{
augroup MyAutoCmd
    autocmd!

    au FileType * setlocal fo-=o fo-=r
    au BufRead,BufNewFile *.psgi setf perl
    au BufRead,BufNewFile *.t setf perl
    au BufRead,BufNewFile *.tt setf perl

    au BufNewFile *.pl 0r $HOME/.vim/skel/skel.pl|normal 5G

    au FileType go packadd vim-go
    au FileType rust packadd rust.vim
    au FileType rust packadd vim-lsp

    au FileType markdown packadd vim-gfm-syntax
    au FileType markdown packadd vim-quickrun-markdown-gfm
    au FileType help  nnoremap <buffer> q :q<cr>
    au FileType man   nnoremap <buffer> q :q<cr>
    au FileType godoc nnoremap <buffer> q :q<cr>

    runtime macros/matchit.vim
    
augroup END
" }}}

" quickrun {{{
let g:quickrun_config = {}
function! s:set_quickrun(dict)
  call extend(g:quickrun_config, a:dict)
endfunction

call s:set_quickrun({
            \ "perl": {
            \   "hook/time/enable": 1,
            \ }})
call s:set_quickrun({
            \ "perl/test": {
            \   "exec": "%c %o %s:p",
            \   "command": "prove",
            \   "cmdopt": "-vlr",
            \   "hook/shebang/enable": 0,
            \ }})
call s:set_quickrun({
            \ "markdown": {
            \   "outputter": "browser",
            \ }})
call s:set_quickrun({
            \ "markdown/github": {
            \   "type": "markdown/gfm",
            \   "outputter": "browser",
            \ }})
call s:set_quickrun({
            \ "html": {
            \   "exec": "%c %s:p",
            \   "command": "safari",
            \ }})
call s:set_quickrun({
            \ "rust/run": {
            \ "exec": "%c %o",
            \ "command": "cargo",
            \ "cmdopt": "run",
            \ }})
call s:set_quickrun({
            \ "rust/test": {
            \ "exec": "%c %o",
            \ "command": "cargo",
            \ "cmdopt": "test",
            \ }})
nnoremap <leader>rp :QuickRun perl/test<cr>
nnoremap <leader>rm :QuickRun markdown/github<cr>
nnoremap <leader>rg :QuickRun rust/run<cr>
nnoremap <leader>rt :QuickRun rust/test<cr>
" }}}

" loadafterft {{{
let g:execcmd_after_ftplugin = {
            \ '_': [
            \   'setlocal fo-=t fo-=r fo-=o',
            \ ]}
" }}}


" open-browser {{{
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

" airline {{{
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_powerline_font = 0
let g:airline_theme = 'powerlineish'
" }}}


set secure

