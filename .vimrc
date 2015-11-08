" lidstah's .vimrc 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible
set t_Co=256
set backupdir-=.
set backupdir^=~/tmp,/tmp

syntax enable
"set background=light
colorscheme lid
" colorscheme wombat256mod
" colorscheme bubblegum
set number
set incsearch
set smartcase
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wildmenu		" enhanced command line completion
set scrolloff=5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin indent on
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
let g:haddock_browser = "firefox"

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
""set cursorline
""set cursorcolumn
set ttyfast
""au CursorHoldI * stopinsert
""au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
""au InsertLeave * let &updatetime=updaterestore
nnoremap j gj
nnoremap k gk
let mapleader = ","
set title
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set laststatus=2
nnoremap <leader><space> :noh<cr>
map <leader>cd :cd %:p:h<CR>
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc
nnoremap <leader>n :call NumberToggle()<CR>
" nnoremap <leader>o :CommandTBuffer<CR>
nnoremap <leader>o :FufFile<CR>
nnoremap <F5> :GundoToggle<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:notes_directory = '~/Documents/Notes'
""let g:Powerline_theme='long'
""let g:Powerline_colorscheme='solarized256_dark'
let g:VimuxOrientation = "v"
let g:VimuxHeight = "33"
map <leader>vr :VimuxPromptCommand<CR>
map <leader>vc :VimuxCloseRunner<CR>
let g:slime_target = "tmux"
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='luna'

"" my little web reader

func! RWeb()
    exe "split"
    exe "enew"
    exe "set buftype=nofile"
    call inputsave()
    let address = input('Enter URL: ')
    call inputrestore()
    let clean_address = substitute(address, '%', '\\%','g')
    let clean_address = substitute(clean_address, '#', '\\#','g')
    let clean_address = substitute(clean_address, '&', '\\&','g')
    exe "silent r!rweb.sh " . clean_address
    exe "norm gg5dd"
endfunction

func! RWebV()
    exe "vsplit"
    exe "enew"
    exe "set buftype=nofile"
    call inputsave()
    let address = input('Enter URL: ')
    call inputrestore()
    let clean_address = substitute(address, '%', '\\%','g')
    let clean_address = substitute(clean_address, '#', '\\#','g')
    let clean_address = substitute(clean_address, '&', '\\&','g')
    exe "silent r!rweb.sh " . clean_address
    exe "norm gg5dd"
endfunction

command! -nargs=0 RWeb call RWeb()
nnoremap <leader>g :RWeb<CR>

command! -nargs=0 RWebV call RWebV()
nnoremap <leader>G :RWebV<CR>
"" slimv
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
