" Vim color file
"
" Name:       xoria256.vim
" Version:    1.5
" Maintainer:	Dmitriy Y. Zotikov (xio) <xio@ungrund.org>
"
" Should work in recent 256 color terminals.  88-color terms like urxvt are
" NOT supported.
"
" Don't forget to install 'ncurses-term' and set TERM to xterm-256color or
" similar value.
"
" Color numbers (0-255) see:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
"
" For a specific filetype highlighting rules issue :syntax list when a file of
" that type is opened.

" Initialization {{{
if &t_Co != 256 && ! has("gui_running")
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "lid-erosion"
"}}}
" Colours {{{1
"" General {{{2
hi Normal       guifg=#d0d0d0 guibg=#1c1c1c cterm=none gui=none
hi Cursor                                 ctermbg=14 guibg=#ffaf00
hi CursorColumn                           ctermbg=0 guibg=#444444
hi CursorLine                             ctermbg=0 guibg=#3a3a3a cterm=none gui=none
hi Error        ctermfg=15  guifg=#ffffff ctermbg=1   guibg=#800000
hi ErrorMsg     ctermfg=15  guifg=#ffffff ctermbg=1   guibg=#800000
hi FoldColumn   ctermfg=247 guifg=#9e9e9e ctermbg=233 guibg=#121212
hi Folded       ctermfg=255 guifg=#eeeeee ctermbg=0  guibg=#5f5f87
hi IncSearch    ctermfg=0   guifg=#000000 ctermbg=3 guibg=#ffdfaf cterm=none gui=none
hi LineNr       ctermfg=247 guifg=#9e9e9e ctermbg=0 guibg=#121212
hi MatchParen   ctermfg=188 guifg=#dfdfdf ctermbg=13  guibg=#5f87df cterm=bold gui=bold
" TODO
" hi MoreMsg
hi NonText      ctermfg=247 guifg=#9e9e9e guibg=#121212 cterm=bold gui=bold
hi Pmenu        ctermfg=14  guifg=#000000 ctermbg=0 guibg=#bcbcbc
hi PmenuSel     ctermfg=7 guifg=#eeeeee ctermbg=8 guibg=#767676
hi PmenuSbar                              ctermbg=8 guibg=#d0d0d0
hi PmenuThumb   ctermfg=243 guifg=#767676
hi Search       ctermfg=0   guifg=#000000 ctermbg=11 guibg=#afdf5f
hi SignColumn   ctermfg=248 guifg=#a8a8a8
hi SpecialKey   ctermfg=15  guifg=#5fdf5f
hi SpellBad     ctermfg=160 cterm=underline               guisp=#df0000
hi SpellCap     ctermfg=189 guifg=#dfdfff cterm=underline gui=underline
hi SpellRare    ctermfg=168 guifg=#df5f87 cterm=underline gui=underline
hi SpellLocal   ctermfg=98  guifg=#875fdf cterm=underline gui=underline
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi TabLine      ctermfg=252  ctermbg=3 guibg=#666666 cterm=none gui=none
hi TabLineFill  ctermfg=252   ctermbg=0 guibg=#3a3a3a cterm=none gui=none
" FIXME
hi Title        ctermfg=225 guifg=#ffdfff
hi Todo         ctermfg=0   guifg=#000000 ctermbg=184 guibg=#dfdf00
hi Underlined   ctermfg=39  guifg=#00afff                           cterm=underline gui=underline
hi VertSplit    ctermfg=237 guifg=#3a3a3a ctermbg=0 guibg=#3a3a3a cterm=none gui=none
" hi VIsualNOS    ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afdfff cterm=none gui=none
" hi Visual       ctermfg=24  guifg=#005f87 ctermbg=153 guibg=#afdfff
hi Visual       ctermfg=255 guifg=#eeeeee ctermbg=12  guibg=#875f87
" hi Visual       ctermfg=255 guifg=#eeeeee ctermbg=24  guibg=#005f87
hi VisualNOS    ctermfg=255 guifg=#eeeeee ctermbg=60  guibg=#5f5f87
hi WildMenu     ctermfg=0   guifg=#000000 ctermbg=150 guibg=#afdf87 cterm=bold gui=bold

"" Syntax highlighting {{{2
hi Comment      ctermfg=5 guifg=#808080
hi Constant     ctermfg=10 guifg=#ffffaf
hi Identifier   ctermfg=4 guifg=#dfafdf                           cterm=bold
hi Ignore       ctermfg=7 guifg=#444444
hi Number       ctermfg=3 guifg=#dfaf87
hi PreProc      ctermfg=2 guifg=#afdf87
hi Special      ctermfg=6 guifg=#df8787 			    cterm=bold
hi Statement    ctermfg=1 guifg=#87afdf                           cterm=bold gui=none
hi Type         ctermfg=11 guifg=#afafdf

"" Special {{{2
""" .diff {{{3
hi diffAdded    ctermfg=150 guifg=#afdf87
hi diffRemoved  ctermfg=174 guifg=#df8787
""" vimdiff {{{3
""" HTML {{{3
" hi htmlTag      ctermfg=146  guifg=#afafdf
" hi htmlEndTag   ctermfg=146  guifg=#afafdf
hi htmlTag      ctermfg=244
hi htmlEndTag   ctermfg=244
hi htmlArg	ctermfg=182  guifg=#dfafdf
hi htmlValue	ctermfg=187  guifg=#dfdfaf
hi htmlTitle	ctermfg=254  ctermbg=95
" hi htmlArg	ctermfg=146
" hi htmlTagName	ctermfg=146
" hi htmlString	ctermfg=187
""" django {{{3
hi djangoVarBlock ctermfg=180
hi djangoTagBlock ctermfg=150
hi djangoStatement ctermfg=146
hi djangoFilter ctermfg=174
""" python {{{3
hi pythonExceptions ctermfg=174
""" NERDTree {{{3
hi Directory      ctermfg=110  guifg=#87afdf
hi treeCWD        ctermfg=180  guifg=#dfaf87
hi treeClosable   ctermfg=174  guifg=#df8787
hi treeOpenable   ctermfg=150  guifg=#afdf87
hi treePart       ctermfg=244  guifg=#808080
hi treeDirSlash   ctermfg=244  guifg=#808080
hi treeLink       ctermfg=182  guifg=#dfafdf

""" VimDebug {{{3
" FIXME
" you may want to set SignColumn highlight in your .vimrc
" :help sign
" :help SignColumn

" hi currentLine term=reverse cterm=reverse gui=reverse
" hi breakPoint  term=NONE    cterm=NONE    gui=NONE
" hi empty       term=NONE    cterm=NONE    gui=NONE

" sign define currentLine linehl=currentLine
" sign define breakPoint  linehl=breakPoint  text=>>
" sign define both        linehl=currentLine text=>>
" sign define empty       linehl=empty

