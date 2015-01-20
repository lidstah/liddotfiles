" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	craniu <From Reddit>
" Last Change:	2011 February 11
" Version:    1.0 
" Notes:      Supports 256 and 16,777,216 (RGB/GUI) color modes

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "craniu256"

if has("gui_running")

	hi Normal         guibg=#080808  guifg=#BCBCBC   gui=none
	hi SpecialKey     guibg=#080808  guifg=#D787D7   gui=none
	hi VertSplit      guibg=#080808  guifg=#FFFF5F   gui=none
	hi SignColumn     guibg=#080808  guifg=#AF87FF   gui=none
	hi NonText        guibg=#080808  guifg=#FF5F87   gui=none
	hi Directory      guibg=#080808  guifg=#FFFF5F   gui=none 
	hi Title          guibg=#080808  guifg=#5FFF87   gui=bold

	" -> Cursor 
	hi Cursor         guibg=#FFFF5F  guifg=#080808   gui=none
	hi CursorIM       guibg=#FFFF5F  guifg=#080808   gui=none
	hi CursorColumn   guibg=#262626                	 gui=none
	hi CursorLine     guibg=#262626                	 gui=none

	" -> Folding
	hi FoldColumn     guibg=#080808  guifg=#005FAF   gui=none
	hi Folded         guibg=#080808  guifg=#005FAF   gui=none

	" -> Line info  
	hi LineNr         guibg=#000000  guifg=#585858   gui=none
	hi StatusLine     guibg=#000000  guifg=#626262   gui=none
	hi StatusLineNC   guibg=#3A3A3A  guifg=#626262   gui=none

	" -> Messages
	hi ErrorMsg       guibg=#AF0000  guifg=#D0D0D0   gui=none
	hi Question       guibg=#080808  guifg=#FFAF00   gui=none
	hi WarningMsg     guibg=#FFAF00  guifg=#000000   gui=none
	hi MoreMsg        guibg=#080808  guifg=#FFAF00   gui=none
	hi ModeMsg        guibg=#080808  guifg=#FFAF00   gui=none

	" -> Search 
	hi Search         guibg=#626262  guifg=#FFFF5F   gui=none 
	hi IncSearch      guibg=#626262  guifg=#FFFF5F   gui=none

	" -> Diff
	hi DiffAdd        guibg=#005F00  guifg=#FF8700   gui=none
	hi DiffChange     guibg=#262626  guifg=#AF5F00   gui=none
	hi DiffDelete     guibg=#080808  guifg=#FF8700   gui=none
	hi DiffText       guibg=#005F87  guifg=#FF8700   gui=underline

	" -> Menu
	hi Pmenu          guibg=#000000  guifg=#5F0000   gui=none
	hi PmenuSel       guibg=#FF8700  guifg=#5F0000   gui=none
	hi PmenuSbar      guibg=#5F0000                  gui=none
	hi PmenuThumb     guibg=#5F0000                  gui=none
	hi PmenuSel       guibg=#FF8700  guifg=#5F0000   gui=none

	" -> Tabs
	hi TabLine        guibg=#000000  guifg=#585858   gui=underline
	hi TabLineFill    guibg=#000000  guifg=#585858   gui=underline
	hi TabLineSel     guibg=#585858  guifg=#D0D0D0   gui=bold 
	"
	" -> Visual Mode
	hi Visual         guibg=#FF8700  guifg=#080808   gui=bold 
	hi VisualNOS      guibg=#000000  guifg=#FF8700   gui=none

	" -> Code
	hi Comment        guibg=#080808  guifg=#585858   gui=bold
	hi Constant       guibg=#080808  guifg=#FF8700   gui=bold
	hi String         guibg=#080808  guifg=#AF8700   gui=none
	hi Error          guibg=#080808  guifg=#FF5F5F   gui=none
	hi Identifier     guibg=#080808  guifg=#87AF00   gui=bold
	hi Function       guibg=#080808  guifg=#87AF87   gui=bold
	hi Ignore         guibg=#080808  guifg=#080808   gui=none
	hi MatchParen     guibg=#FFAF00  guifg=#080808   gui=bold
	hi PreProc        guibg=#080808  guifg=#FFFFAF   gui=bold
	hi Special        guibg=#080808  guifg=#FFFF87   gui=none
	hi Todo           guibg=#080808  guifg=#FF5F5F   gui=bold
	hi Underlined     guibg=#080808  guifg=#FF5F5F   gui=underline
	hi Statement      guibg=#080808  guifg=#FFD700   gui=bold
	hi Operator       guibg=#080808  guifg=#D7FFAF   gui=bold
	hi Delimiter      guibg=#080808  guifg=#875F5F   gui=bold
	hi Type           guibg=#080808  guifg=#5F5F00   gui=bold
	hi Exception      guibg=#080808  guifg=#FF8787   gui=bold 

	" -> HTML-specific
	hi htmlBold                 guibg=#080808  guifg=#D0D0D0   gui=bold
	hi htmlBoldItalic           guibg=#080808  guifg=#D0D0D0   gui=bold,italic
	hi htmlBoldUnderline        guibg=#080808  guifg=#D0D0D0   gui=bold,underline
	hi htmlBoldUnderlineItalic  guibg=#080808  guifg=#D0D0D0   gui=bold,underline,italic
	hi htmlItalic               guibg=#080808  guifg=#D0D0D0   gui=italic
	hi htmlUnderline            guibg=#080808  guifg=#D0D0D0   gui=underline
	hi htmlUnderlineItalic      guibg=#080808  guifg=#D0D0D0   gui=underline,italic

elseif &t_Co == 256

	hi Normal         ctermbg=0  ctermfg=250   cterm=none
	hi SpecialKey     ctermbg=0  ctermfg=176   cterm=none
	hi VertSplit      ctermbg=0  ctermfg=227   cterm=none
	hi SignColumn     ctermbg=0  ctermfg=141   cterm=none
	hi NonText        ctermbg=0  ctermfg=204   cterm=none
	hi Directory      ctermbg=0  ctermfg=227   cterm=none 
	hi Title          ctermbg=0  ctermfg=84    cterm=bold

	" -> Cursor 
	hi Cursor         ctermbg=227  ctermfg=0   cterm=none
	hi CursorIM       ctermbg=227  ctermfg=0   cterm=none
	hi CursorColumn   ctermbg=235                cterm=none
	hi CursorLine     ctermbg=235                cterm=none

	" -> Folding
	hi FoldColumn     ctermbg=0  ctermfg=25    cterm=none
	hi Folded         ctermbg=0  ctermfg=25    cterm=none

	" -> Line info  
	hi LineNr         ctermbg=0    ctermfg=240   cterm=none
	hi StatusLine     ctermbg=0    ctermfg=241   cterm=none
	hi StatusLineNC   ctermbg=237  ctermfg=241   cterm=none

	" -> Messages
	hi ErrorMsg       ctermbg=124  ctermfg=252   cterm=none
	hi Question       ctermbg=0  ctermfg=214   cterm=none
	hi WarningMsg     ctermbg=214  ctermfg=0     cterm=none
	hi MoreMsg        ctermbg=0  ctermfg=214   cterm=none
	hi ModeMsg        ctermbg=0  ctermfg=214   cterm=none

	" -> Search 
	hi Search         ctermbg=241  ctermfg=227   cterm=none 
	hi IncSearch      ctermbg=241  ctermfg=227   cterm=none

	" -> Diff
	hi DiffAdd        ctermbg=22   ctermfg=208   cterm=none
	hi DiffChange     ctermbg=235  ctermfg=130   cterm=none
	hi DiffDelete     ctermbg=0  ctermfg=208   cterm=none
	hi DiffText       ctermbg=24   ctermfg=208   cterm=underline

	" -> Menu
	hi Pmenu          ctermbg=0    ctermfg=52    cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none
	hi PmenuSbar      ctermbg=52                 cterm=none
	hi PmenuThumb     ctermbg=52                 cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none

	" -> Tabs
	hi TabLine        ctermbg=000  ctermfg=240   cterm=underline
	hi TabLineFill    ctermbg=000  ctermfg=240   cterm=underline
	hi TabLineSel     ctermbg=240  ctermfg=252   cterm=bold 
	"
	" -> Visual Mode
	hi Visual         ctermbg=208  ctermfg=0   cterm=bold 
	hi VisualNOS      ctermbg=0    ctermfg=208   cterm=none

	" -> Code
	hi Comment        ctermbg=0  ctermfg=240   cterm=bold
	hi Constant       ctermbg=0  ctermfg=208   cterm=bold
	hi String         ctermbg=0  ctermfg=136   cterm=none
	hi Error          ctermbg=0  ctermfg=203   cterm=none
	hi Identifier     ctermbg=0  ctermfg=106   cterm=bold
	hi Function       ctermbg=0  ctermfg=108   cterm=bold
	hi Ignore         ctermbg=0  ctermfg=0   cterm=none
	hi MatchParen     ctermbg=214  ctermfg=0   cterm=bold
	hi PreProc        ctermbg=0  ctermfg=229   cterm=bold
	hi Special        ctermbg=0  ctermfg=228   cterm=none
	hi Todo           ctermbg=0  ctermfg=203   cterm=bold
	hi Underlined     ctermbg=0  ctermfg=203   cterm=underline
	hi Statement      ctermbg=0  ctermfg=220   cterm=bold
	hi Operator       ctermbg=0  ctermfg=193   cterm=bold
	hi Delimiter      ctermbg=0  ctermfg=095   cterm=bold
	hi Type           ctermbg=0  ctermfg=58    cterm=bold
	hi Exception      ctermbg=0  ctermfg=210   cterm=bold 

	" -> HTML-specific
	hi htmlBold                 ctermbg=0  ctermfg=252   cterm=bold
	hi htmlBoldItalic           ctermbg=0  ctermfg=252   cterm=bold,italic
	hi htmlBoldUnderline        ctermbg=0  ctermfg=252   cterm=bold,underline
	hi htmlBoldUnderlineItalic  ctermbg=0  ctermfg=252   cterm=bold,underline,italic
	hi htmlItalic               ctermbg=0  ctermfg=252   cterm=italic
	hi htmlUnderline            ctermbg=0  ctermfg=252   cterm=underline
	hi htmlUnderlineItalic      ctermbg=0  ctermfg=252   cterm=underline,italic

endif
