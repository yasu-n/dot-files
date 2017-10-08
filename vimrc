" ~/.vimrc
" maintainer: yasu-n<yasun.pl@gmail.com>
" latest: May 2 2017
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


filetype plugin indent on
syntax enable

" package {{{
packadd! vim-go
packadd! vim-elixir
" }}}

" settings {{{
set fileformat=unix
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set encoding=utf-8
scriptencoding utf-8
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
set t_Co=256
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
hi perlComment ctermfg=darkgray
hi perlDATA ctermfg=cyan
hi perlPOD ctermfg=darkgray
" }}}

" autocmd {{{
augroup MyAutoCmd
    autocmd!

    au FileType * setlocal fo-=o fo-=r
    au BufRead,BufNewFile *.psgi setf perl
    au BufRead,BufNewFile *.t setf perl
    au BufRead,BufNewFile *.tt setf perl

    au BufNewFile *.pl 0r $HOME/.vim/skel/skel.pl|normal 5G

    au FileType help  nnoremap <buffer> q :q<cr>
    au FileType man   nnoremap <buffer> q :q<cr>
    au FileType godoc nnoremap <buffer> q :q<cr>

    au BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mar*} set filetype=markdown

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
            \   "commant": "prove",
            \   "cmdopt": "-vlr",
            \   "hook/shebang/enable": 0,
            \ }})
call s:set_quickrun({
            \ "html": {
            \   "exec": "%c %s:p",
            \   "command": "safari",
            \ }})
nnoremap <leader>rp :QuickRun perl/text<cr>
nnoremap <leader>rm :QuickRun markdown/github<cr>
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

