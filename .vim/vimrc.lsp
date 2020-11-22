" vi: ft=vim
"" LSP configuration

"function! s:on_lsp_buffer_enabled() abort
"  setlocal omnifunc=lsp#complete
"  setlocal signcolumn=yes
"  "nmap <buffer> gd <plug>(lsp-definition)
"  "nmap <buffer> <f2> <plug>(lsp-rename)
"  " refer to doc to add more commands
"endfunction

"augroup lsp_install
"  au!
"  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

"" folding
"set foldmethod=expr
"      \ foldexpr=lsp#ui#vim#folding#foldexpr()
"      \ foldtext=lsp#ui#vim#folding#foldtext()
let g:lsp_fold_enabled = 0

" diagnostics
let g:lsp_diagnostics_enabled = 0

" signs
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': 'E'}
let g:lsp_signs_warning = {'text': 'W'}
let g:lsp_signs_information = {'text': 'I'}
let g:lsp_signs_hint = {'text': 'H'}

" echo under cursor when in normal mode
let g:lsp_diagnostics_echo_cursor = 1

" highlights
let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1

" virtual text
let g:lsp_virtual_text_enabled = 1

" highlight references
let g:lsp_highlight_references_enabled = 1

" debugging for lsp
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')
