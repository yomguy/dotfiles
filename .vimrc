" ----------- Reminder --------- 
"  Reminder :
"  :tabe && gt to switch tab
"  :vnew
"  :vs && CTRL-W + arrows
"  CTRL + P
"  ci) ==> Change inside parentheses

" ----------- Plugins --------- 
call plug#begin('~/.vim/plugged')

" ---------- Languages ---------- 
Plug 'wting/rust.vim'
Plug 'fatih/vim-go'
Plug 'alvan/vim-closetag'		  " Automatically close HTML/XML tags
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'posva/vim-vue'
"Plug 'StanAngeloff/php.vim'
" Plug 'LeBarbu/vim-epitech'	          " Headers && indentation stuff
" Plug 'klen/python-mode'

" ----------- Themes --------- 
" Plug 'ayu-theme/ayu-vim'
" Plug 'altercation/vim-colors-solarized'
 Plug 'tomasr/molokai'
" Plug 'mhartington/oceanic-next'
" Plug 'junegunn/seoul256.vim'

" ----------- Others --------- 
Plug 'mhinz/vim-signify'	" Show git diff via vim sign column
"Plug 'Valloric/MatchTagAlways'	" Highlight balise (HTML) in which your cursor is
Plug 'tpope/vim-surround'	" Use cs"' to replace things around a line
Plug 'scrooloose/nerdcommenter' " <Leader> ci to comment/uncomment or L-cm L-cs L-cc L-cu
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/conflict-marker.vim'
"Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'junegunn/vim-easy-align'
Plug 'python-mode/python-mode', { 'branch': 'master' }
Plug 'tpope/vim-fugitive'

call plug#end()

" ---------- Global configuration ----------
filetype plugin indent on
let mapleader = ","

" ---------- Theme configuration ----------
syntax enable
highlight ColorColumn ctermbg=10 " Change color of 80 columns bar
set cursorline

if has('termguicolors') " Terminal with True colors enabled. See https://gist.github.com/XVilka/8346728
  set termguicolors
  let ayucolor="mirage" " for mirage version of theme
  colorscheme molokai
endif

if has('gui_running') " Setup for the visual environment
  set guioptions-=T
  set guioptions-=m
  set guioptions+=c
  if !has("unix")
    set guifont=Consolas:h10
    winsize 120 30
  endif
endif

" ---------- epitech-vim configuration ----------
" let g:header_update = 0 " Disable automatic header update when saving a file in vim-epitech plugin

" ---------- ale ----------
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" ---------- syntastic configuration ----------
"let g:syntastic_go_checkers = ['gofmt', 'goimports']
let g:syntastic_c_checkers=['make DEBUG=yes', 'gcc'] " set syntastic default checker
"let g:syntastic_asm_compiler=['nasm']

" ---------- ctrp configuration ----------
let g:ctrlp_custom_ignore = '\v\.o$' " Do not list .o files

" ---------- vim-go configuration ----------
let g:go_metalinter_autosave = 1 " call metalinter on save

let g:go_metalinter_autosave_enabled = ['vet', 'golint' ]
" errcheck and unused are too slow to be called on save
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'unused' ]
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'unused', 'goimports', 'gotype', 'deadcode', 'varcheck', 'structcheck', 'ineffassign', 'unconvert', 'goconst', 'gosimple', 'staticcheck', 'misspell']

" goimports is basically gofmt + auto-replace the imports
let g:go_fmt_command = "goimports"

" ---------- nerdtree configuration ----------

"autocmd vimenter * NERDTree " Nerdtree automatically starts when vim starts
"
""Close NERDTree if it is the last open buffer
"" Close all open buffers on entering a window if the only
"" buffer that's left is the NERDTree buffer
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
"function! s:CloseIfOnlyNerdTreeLeft()
"  if exists("t:NERDTreeBufName")
"    if bufwinnr(t:NERDTreeBufName) != -1
"      if winnr("$") == 1
"        q
"      endif
"    endif
"  endif
"endfunction

nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" ---------------------------------------------------------------------------
" operational settings
set nocompatible                " vim defaults, not vi!
set hidden                      " allow editing multiple unsaved buffers
set more                        " the 'more' prompt
set autoread                    " watch for file changes by other programs
"set vb t_vb=
"set visualbell t_vb=

":set patchmode=~                " only produce *~ if not there
set noautowrite                 " don't automatically write on :next, etc
set wildmenu                    " : menu has tab completion, etc
set scrolloff=5                 " keep at least 5 lines above/below cursor
set sidescrolloff=5             " keep at least 5 columns left/right of cursor
set history=300                 " remember the last 300 commands
set showcmd

" ---------------------------------------------------------------------------
" window spacing
set cmdheight=2                 " make command line two lines high
set ruler                       " show the line number on bar
set lazyredraw                  " don't redraw when running macros
set number                      " show line number on each line
"set winheight=999               " maximize split windows
"set winminheight=0              " completely hide other windws

map <LocalLeader>w+ 100<C-w>+  " grow by 100
map <LocalLeader>w- 100<C-w>-  " shrink by 100

" ---------------------------------------------------------------------------
" mouse settings
set mouse=a                     " mouse support in all modes
set mousehide                   " hide the mouse when typing text

" ,p and shift-insert will paste the X buffer, even on the command line
imap <S-Insert> <S-MiddleMouse>
cmap <S-Insert> <S-MiddleMouse>

" this makes the mouse paste a block of text without formatting it
map <MouseMiddle> <esc>"*p

" ---------------------------------------------------------------------------
" global editing settings
set autoindent smartindent cindent     " turn on auto/smart indenting
" set expandtab                 " use spaces, not tabs
set smarttab                    " make <tab> and <backspace> smarter
set shiftwidth=2                " indents of 2
set tabstop=2
set softtabstop=2
"set backspace=eol,start,indent  " allow backspacing over indent, eol, & start
set undolevels=1000             " number of forgivable mistakes
set updatecount=100             " write swap file to disk every 100 chars
set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set formatoptions+=r
set comments=sl:/*,mb:**,elx:*/   " Comments for Epitech Norme
"set textwidth=80

set nofoldenable

"" C Indent parameter of multi-line declaration of function !
set cino=(0
"set cino =>4^-2e2{2n-2
"set cino=c0,C1

"" Indent like emacs !
"set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2

" ---------------------------------------------------------------------------
" searching...
set hlsearch                   " enable search highlight globally
set incsearch                  " show matches as soon as possible
set showmatch                  " show matching brackets when typing
" disable last one highlight
nmap <LocalLeader>nh :nohlsearch<cr>

set diffopt=filler,iwhite       " ignore all whitespace and sync

" find git's merge conflict markers
:map <LocalLeader>fc /\v^[<=>]{7}( .*\|$)<CR>

" neovim requirements
"let g:python_host_prog = '/usr/bin/python'

" ---------- ASM-specific ----------
au BufRead,BufNewFile *.asm set filetype=nasm " Overide filetype nasm for .asm files
let g:syntastic_nasm_nasm_post_args = "-f elf64"

" ---------- Go Specific ----------  
autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8 et

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
