" ~/.vimrc
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
"set fileformat=unix
set fileformats=unix,dos,mac
set backspace=indent,eol,start
"scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=utf-8
"set smarttab
"set ambiwidth=double
"set tabstop=2
"set shiftwidth=2
"set softtabstop=0
"set expandtab
"set shortmess+=l
set incsearch
set splitright
"set noequalalways
set completeopt=menu,preview
"set switchbuf=useopen
set wildmode=longest,full
"set diffopt+=vertical
set matchpairs+=<:>
set hidden
"set imdisable
set ignorecase
set modeline
set directory-=$HOME/.vim/swap
"set showcmd
"set showmatch
"set pumheight=15
"set previewheight=5
"set nobackup
set laststatus=2
set cmdheight=3
"set ttyfast
"set termwinsize=15x0
set number
"let mapleader = "\<Space>"
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

    au FileType * setlocal fo-=t fo-=r fo-=o
    au FileType help  nnoremap <buffer> q :q<cr>
    au FileType man   nnoremap <buffer> q :q<cr>

    runtime macros/matchit.vim
    
augroup END
" }}}

" quickrun {{{
"let g:quickrun_config = {}
"function! s:set_quickrun(dict)
"  call extend(g:quickrun_config, a:dict)
"endfunction
"
"call s:set_quickrun({
"            \ "perl": {
"            \   "hook/time/enable": 1,
"            \ }})
"call s:set_quickrun({
"            \ "perl/test": {
"            \   "exec": "%c %o %s:p",
"            \   "command": "prove",
"            \   "cmdopt": "-vlr",
"            \   "hook/shebang/enable": 0,
"            \ }})
"call s:set_quickrun({
"            \ "markdown": {
"            \   "outputter": "browser",
"            \ }})
"call s:set_quickrun({
"            \ "html": {
"            \   "exec": "%c %s:p",
"            \   "command": "safari",
"            \ }})
"nnoremap <leader>rp :QuickRun perl/test<cr>
" }}}

" loadafterft {{{
"let g:execcmd_after_ftplugin = {
"            \ '_': [
"            \   'setlocal fo-=t fo-=r fo-=o',
"            \ ]}
" }}}

" vim-lsp {{{
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" }}}

" open-browser {{{
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

" airline {{{
"let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#readonly#enabled = 0
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline_detect_modified = 1
"let g:airline_detect_paste = 1
"let g:airline_powerline_font = 0
let g:airline_theme = 'powerlineish'
" }}}

" ctrlp.vim {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = [ 'tabs' ]
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
" }}}

set secure

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
