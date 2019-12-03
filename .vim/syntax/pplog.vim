" datetime groups
syn match logDate '\d\{4}-\d\{2}-\d\{2}' nextgroup=logTime skipwhite contained
syn match logTime '\d\{2}:\d\{2}:\d\{2}\.\d\{3}' contained

" attributes groups
syn match attrName '[A-Za-z0-9_\-\.]\+\ze=' nextgroup=attrValue contained
syn match attrValue '=\zs[A-Za-z0-9_\-\.]\+' contained
syn match attrFull '[A-Za-z0-9_\-\.]\+=[A-Za-z0-9_\-\.]\+' contains=attrName,attrValue contained
syn region attrBracket start='\[' end='\]' contains=attrFull transparent

" java stack groups
syn region causedBy start='Caused by:' end='\n'
syn region stackAt start='^\s*at' end='\n'
syn region stackOmitted start='^\s*\.\.\.' end='\n'

" message type groups
syn region logMsgDebug start='^\[DEBUG' end='\n' contains=logDate,logTime,attrBracket,mpan
syn region logMsgInfo start='^\[INFO' end='\n' contains=logdate,logTime,attrBracket,mpan
syn region logMsgWarn start='^\[WARN' end='\n' contains=logDate,logTime,attrBracket,mpan
syn region logMsgError start='^\[ERROR' end='\n' contains=logDate,logTime,attrBracket,mpan

" mpan group
syn match mpan '\d\{6}\*\{6}\d\{4}' contained
syn match mpanex '\d\{6}\*\{6}\d\{4}'

" xml group
syn match xmlAttrvalue '"[^"]\+"' contained
syn match xmlAttrName '[A-Za-z0-9_\-\.\:]\+' contained
syn match xmlAttr '[A-Za-z0-9_\-\.\:]\+="[^"]\+"' contains=xmlAttrName,xmlAttrValue contained
syn match xmlTag '</\?\zs[A-Za-z0-9_\-\.\:]\+' contained
syn match xmlBracket '<[^<>]\+>' contains=xmlTag,xmlAttr
"syn match mpan '\d\{6}\*\{6}\d\{4}'
" Now make them appear:
" Link just links logError to the colouring for error
"hi link logError Error
"hi link logWarn Warning
"hi link logInfo Info
"hi link logDebug Debug
"hi link logTrace Trace
" Def means default colour - colourschemes can override

" highlights
"
hi def logDate ctermfg=lightblue
hi def logTime ctermfg=lightblue

hi def attrName ctermfg=darkyellow
hi def attrValue ctermfg=magenta
hi def attrFull ctermfg=white

hi def causedBy ctermfg=red
hi def stackAt ctermfg=darkgray
hi def stackOmitted ctermfg=darkgray

hi def logMsgDebug ctermfg=darkgray
hi def logMsgInfo ctermfg=gray
hi def logMsgWarn ctermfg=yellow
hi def logMsgError ctermfg=red

hi def mpan ctermfg=green
hi def mpanex ctermfg=green

hi def xmlAttrValue ctermfg=magenta
hi def xmlAttrName ctermfg=darkyellow
hi def xmlAttr ctermfg=lightred
hi def xmlTag ctermfg=lightred
hi def xmlBracket ctermfg=darkgray
"hi def xmlTag ctermfg=lightblue

"" iwaylog.vim
"" Vim syntax file
"" Based on messages.vim - syntax file for highlighting kernel messages
"if exists("b:current_syntax")
" finish
"endif
"" We want to match lines with keywords like FATAL or ERROR
"syn match log_error 'c.*<(FATAL|ERROR|ERRORS|FAIL|FAILED|FAILURE).*'
"" The same with WARNING, but we want a different highlighting
"" for those lines.
"syn match log_warning 'c.*<(WARNcING).*'
"" Things between quotes are strings
"syn region log_string start=/"/ end=/"/ skip=/\./
"syn match log_number '0x[0-9a-fA-F]*|[<[0-9a-f]+>]|<d[0-9a-fA-F]*'
"syn match log_number '{d{6,}}'
"" Match the date: dd/mm/yyyy hh:mm:ss
"syn match log_date 'd{2}/d{2}/d{4}s*d{2}:d{2}:d{2}'
"" A component is something between brackets
"syn match component '[[^]]*]'
"" Match IP addresses
"syn match internet 'dd*.dd*.dd*.dd*'
"" Match IPv6 address, macaddresses and some other stuff
"syn match internet '(x*:){5,}xx*'
"syn keyword dhcp_keywords DISCOVER OFFER REQUEST ACK INFORM RENEW
"syn keyword dhcp_keywords DHCPDISCOVER DHCPOFFER DHCPREQUEST DHCPACK DHCPINFORM DHCPRENEW
"syn keyword dhcp_keywords SOLICIT ADVERTISE REPLY
"syn keyword hard_keywords CMTS MTA CPE CM
"" Now we apply color
"hi def link log_string String
"hi def link log_error ErrorMsg
"hi def link log_warning WarningMsg
"hi def log_date guifg=#bbbbbb
"hi def component guifg=#bbbbbb
"hi def internet guifg=#cccc33
"hi def internet guifg=#cccc33
"hi def dhcp_keywords guifg=#bbbbdd
"hi def hard_keywords guifg=#ddddff guibg=#444444
