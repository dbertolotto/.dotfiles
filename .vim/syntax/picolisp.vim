autocmd FileType picolisp call s:PicoLisp()
	function! s:PicoLisp()

    syn match PicoLispComment /#.*$/
		syn region PicoLispCommentRegion start="#{" end="}#"
		syn match PicoLispNumber /\v<[-+]?\d+(\.\d+)?>/
		syn region PicoLispTransient start=/"/ skip=/\\\\\|\\"/ end=/"/
		syn match PicoLispParentheses /[()\[\]]/

		hi default link PicoLispComment Comment
		hi default link PicoLispCommentRegion Comment
		hi default link PicoLispNumber Number
		hi default link PicoLispTransient String
		hi PicoLispParentheses ctermfg=8 guifg=DarkGrey

  endfunction
autocmd BufRead,BufNewFile *.l setl ft=picolisp
