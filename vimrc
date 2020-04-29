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
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set encoding=utf-8
set termencoding=utf-8
set incsearch
set splitright
set completeopt=menuone,preview
"set wildmode=longest,full
set matchpairs+=<:>
set hidden
set ignorecase
set modeline
set directory=$HOME/.vim/swap
set laststatus=2
set cmdheight=3
set number
" }}}

" key mapping {{{
nnoremap <space>3 :<C-u>setlocal relativenumber!<CR>
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
"" }}}

" autocmd {{{
augroup MyAutoCmd
    autocmd!
    au FileType * setlocal fo-=t fo-=r fo-=o
		packadd! matchit
augroup END
" }}}

" vim-lsp {{{
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
" }}}

" open-browser {{{
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

" airline {{{
let g:airline_theme = 'powerlineish'
" }}}

" ctrlp.vim {{{
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_extensions = [ 'tabs' ]
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
" }}}

set secure

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
