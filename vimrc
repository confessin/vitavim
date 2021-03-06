
" vimrc
" Author: Mohammad Rafi <confessin@gmail.com>
" Source: https://github.com/confessin/VitaVim
"
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pep8 - http://pypi.python.org/pypi/pep8
" Pyflakes
" Ack
" Rake & Ruby for command-t
" nose, django-nose

" TODO: Add package maps and package dependent stuff.
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash
filetype off



" ===========================================================
" Vim Internal Configs
" ===========================================================

" BASIC Settings

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set relativenumber
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 4 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set t_Co=256                " For using terminals 256 colors.
" Set folding level increments and decrements.
map <leader>z<Up> :set foldlevel+=1<CR>
map <leader>z<Down> :set foldlevel-=1<CR>
map <leader>z1 :set foldlevel=1<CR>
map <leader>zz :set foldlevel=99<CR>
" don't outdent hashes
"inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    colorscheme kolor
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
else
    colorscheme desert
endif

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal autoindent noexpandtab tabstop=4 shiftwidth=4

" Javascript
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1


" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0



" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

set colorcolumn=79

" adding go conf
"au BufRead,BufNewFile *.go set filetype=go
"au FileType go set rtp+=$GOROOT/misc/vim
"au FileType go filetype plugin indent on
"syntax on

function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec ('match RightMargin /\%>' . &textwidth . 'v.\+/')
  endif
endfunction

augroup filetypedetect
au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
augroup END


" ===========================================================
" Extra Goodies.
" ============================================================

" Bda -  Delete all open buffers.

command! -nargs=0 -bang Bda
    \ :call BufDeleteAll('<bang>')

function! BufDeleteAll(bang)
    let last_buffer = bufnr('$')

    let n = 1
    while n <= last_buffer
        if a:bang == '' && getbufvar(n, '&modified')
            echohl ErrorMsg
            echomsg 'No write since last change for buffer'
                        \ n '(add ! to override)'
            echohl None
            return 0
        endif
        let n = n+1
    endwhile

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if buflisted(n)
            silent exe 'bdel' . a:bang . ' ' . n
            if ! buflisted(n)
                let delete_count = delete_count+1
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

endfunction



" ===========================================================
" Extra 3rd Party packages.
" ============================================================
" All this will be installed using vundle( https://github.com/gmarik/vundle)
" Vundle will be installed with the install.sh.

" PACKAGE LIST {{{
" Use this variable inside your local configuration to declare
" which package you would like to include
if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'fancy', 'os', 'coding', 'ruby', 'html', 'css', 'js', 'clojure', 'haskell', 'color']
endif

set nocompatible         " Don't be compatible with vi.
filetype off             " Required by Vundle.


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'


Plugin 'greplace.vim'

if count(g:vimified_packages, 'general')
    " Git Integration
    Plugin 'tpope/vim-fugitive.git'
    Plugin 'tpope/vim-surround.git'
    Plugin 'tpope/vim-git.git'
    "Plugin 'wincent/Command-T.git'  " this one needs rake/ruby to install. :/
    Plugin 'mileszs/ack.vim.git'
    " This one needs vim 7.3 to install
    Plugin 'sjl/gundo.vim.git'  
    " Disabling this because its really flaky and makes the editor slow."
    " Plugin 'fs111/pydoc.vim.git'
    " disabling this since using syntastic.
    " Plugin 'vim-scripts/pep8.git'
    Plugin 'alfredodeza/pytest.vim.git'
    Plugin 'reinh/vim-makegreen'
    Plugin 'vim-scripts/TaskList.vim.git'
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    " Plugin 'confessin/rope-vim.git'
    Plugin 'python-rope/rope.git'
    Plugin 'python-rope/ropevim.git'
    "Plugin 'vim-scripts/AutoComplPop.git'
    " Plugin 'Shougo/neocomplcache.vim'
    Plugin 'altercation/vim-colors-solarized.git'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    " Install snipmate dependencies
    " Plugin 'MarcWeber/vim-addon-mw-utils'
    " Plugin 'tomtom/tlib_vim'
    " Plugin 'honza/snipmate-snippets'
    " " actual snipmate
    " Plugin 'garbas/vim-snipmate.git'
    " FIXME(mrafi): ultisnips is actually giving problems in keymap with 
    " the supertab and autocomplete.
    Plugin 'Raimondi/delimitMate.git'
    " Plugin 'ervandew/supertab.git'
    "Plugin 'kevinw/pyflakes-vim.git'
    " for fuzzy search of files. supports regex
    Plugin 'ctrlpvim/ctrlp.vim'
    " For 1 lint for all purpose.
    " FIXME: It needs external tools for checking lint
    Plugin 'scrooloose/syntastic.git'
    Plugin 'SirVer/ultisnips.git'
    Plugin 'honza/vim-snippets.git'
    Plugin 'motus/pig.vim'
    Plugin 'freitass/todo.txt-vim.git'
    Plugin 'Valloric/YouCompleteMe.git'
    Plugin 'vim-airline/vim-airline.git'
    Plugin 'scrooloose/nerdcommenter'
endif

"set rtp+=$GOROOT/misc/vim
filetype plugin indent on
" ===========================================================
" Mapping 3rd Party plugins
" ============================================================

" Setting status line with git integration
"set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>


"<CR><C-w>l<C-f>:set scrollbind<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Run pep8
let g:pep8_map='<leader>8'
" ignoring 4 spaces indent checker. I will be using 2 spaces for this.
let g:syntastic_python_checker_args='--ignore=E111'

let g:vim_markdown_folding_disabled = 1

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Run command-t file search
" TODO: Get something else other than CommandT as difficult to deal with
" ruby/rake support
map <leader>f :CtrlP<CR>

" Ack searching
nmap <leader>a <Esc>:Ack!

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" Fixing options for ctrlp (fuzzy file search)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" ignoring blaze files.
set wildignore+=*blaze*/*,*review/*


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:UltiSnipsExpandTrigger="<c-j>"

let g:airline#extensions#tabline#enabled = 1

" VIM Airline Mappings.
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" Tab navigation like Firefox.
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>
inoremap <C-S-tab> <Esc>:bprevious<CR>i
inoremap <C-tab>   <Esc>:bnext<CR>i


" Increase and decrease font size functions.
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()
