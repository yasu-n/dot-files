" common-lsp.vim
if exists('b:did_plugin_common_lsp')
	finish
endif
let b:did_plugin_common_lsp = 1

if empty(globpath(&rtp, 'autoload/lsp.vim'))
    finish
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
		setlocal signcolumn=yes
		if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <space>h <plug>(lsp-hover)
    nmap <buffer> <space>d <plug>(lsp-definition)
    nmap <buffer> <space>i <plug>(lsp-implementation)
		nmap <buffer> <space>gr <plug>(lsp-reference)
    nmap <buffer> <space>] <plug>(lsp-next-diagnostic)
    nmap <buffer> <space>[ <plug>(lsp-previous-diagnostic)
    nmap <buffer> <space>pd <plug>(lsp-peek-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
		nnoremap <buffer> <expr><c-j> lsp#scroll(+4)
		nnoremap <buffer> <expr><c-k> lsp#scroll(-4)

		let g:lsp_format_sync_timeout = 1000
    let g:lsp_diagnostics_virtual_text_enabled = 0
		autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

"let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_echo_cursor = 1

augroup RustLsp
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
