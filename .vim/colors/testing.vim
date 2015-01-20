set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="testing"
hi Normal guifg=#acbfbf guibg=#131716
hi Comment guifg=#606163 guibg=NONE
hi Constant guifg=#8debb6 guibg=NONE
hi String guifg=#16872a guibg=NONE
hi htmlTagName guifg=#e87e7e guibg=NONE
hi Identifier guifg=#527dba guibg=NONE
hi Statement guifg=#c27e7e guibg=NONE
hi PreProc guifg=#28f054 guibg=NONE
hi Type guifg=#60ff60 guibg=NONE
hi Function guifg=#57735c guibg=NONE
hi Repeat guifg=#ccc343 guibg=NONE
hi Operator guifg=#565399 guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special