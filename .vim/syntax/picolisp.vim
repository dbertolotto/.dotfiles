autocmd FileType picolisp call s:PicoLisp()
	function! s:PicoLisp()

    " extended char set for lisp words
    setlocal iskeyword=33,36-38,42-90,92,95,97-122,124,126,128-255

    " --- indentation (disabled, let does not indent properly)
    "
    " activate lisp indentation
    "setlocal lisp ai nosi

    " (pico)lisp words for indentation
    "setlocal lispwords=bind,case,casq,catch,cond,de,def,dm,do,fill,finally,for,if,if2,ifn,in,let,let?,loop,macro,make,nond,out,pipe,prog,throw,unless,until,use,when,while,with

    " --- syntax definition

    " comments
    syn match PilComment /#.*$/
		syn region PilCommentRegion start=/#{/ end=/}#/

    " numbers
		syn match PilNumber /\v<[-+]?\d+(\.\d+)?>/

    " transient symbols
		syn region PilTransient start=/"/ skip=/\\\\\|\\"/ end=/"/

    " parentheses
		syn match PilParentheses /[()\[\]]/

    " --- (minimal) highlighting

		hi default link PilComment Comment
		hi default link PilCommentRegion Comment
		hi default link PilNumber Number
		hi default link PilTransient String

    " make parentheses darker
		hi PilParentheses ctermfg=8 guifg=DarkGrey

  endfunction

" file association
autocmd BufRead,BufNewFile *.l setl ft=picolisp
