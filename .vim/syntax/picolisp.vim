autocmd FileType picolisp call s:PicoLisp()
	function! s:PicoLisp()

    syn match PicoLispComment /#.*$/
		syn region PicoLispCommentRegion start="#{" end="}#"
		syn match PicoLispNumber /\v<[-+]?\d+(\.\d+)?>/
		syn region PicoLispTransient start=/"/ skip=/\\\\\|\\"/ end=/"/
    syn match PicoLispExternal /\v\{[^\(\)\[\]\s]+\}/
		syn match PicoLispParentheses /[()\[\]]/
		syn keyword PicoLispSpecial NIL T This

		hi default link PicoLispComment Comment
		hi default link PicoLispCommentRegion Comment
		hi default link PicoLispNumber Number
		hi default link PicoLispTransient String
		hi default link PicoLispExternal Type
		hi default link PicoLispSpecial Constant
		hi PicoLispParentheses ctermfg=8 guifg=DarkGrey

    setl lispwords+=de,dm
    set lisp

  endfunction
autocmd BufRead,BufNewFile *.l setl ft=picolisp
