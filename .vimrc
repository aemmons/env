set incsearch ignorecase
" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
set number
" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

set lazyredraw

"colorscheme desert
"set background=dark
":hi Normal ctermbg=black

set nocompatible               " be iMproved
set encoding=utf-8
set laststatus=2
set t_Co=256

filetype off                   " required!

" Allow mouse listen region to be full width of window in iTerm2.
if has('mouse_sgr')
    set ttymouse=sgr
endif

set history=700
set autoread
set wildmenu
set ruler
set cmdheight=2
set hlsearch
set magic
set showmatch
set mat=2
syntax enable
set shell=/bin/bash
set gfn=Monospace\ 10
set encoding=utf8
set ffs=unix,mac,dos
set nobackup
set nowb
set noswapfile
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set list
set listchars=tab:>-,trail:-
set colorcolumn=80
set backspace=indent,eol,start
"set formatoptions-=cro
"autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" set statusline+=%{fugitive#statusline()} " Fugitive to show current git branch

" shortcut for removing whitespace from lines with only whitespace.
:command Whitey %s/\s\+$//e

filetype plugin on
set omnifunc=syntaxcomplete#Complete

:vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'), ', ')), ', ')<CR>

" Sort highlighted block of words:
command -range SortList <line1>,<line2>!python -c "import sys; print ' '.join(sorted(sys.stdin.read().split()))"

" Buffergator prefs:
let g:buffergator_viewport_split_policy = "B"

" CommandT shortcut
nmap <C-T> :CommandT<CR>

" TaskList Shortcut
map <unique> <S-T> <Plug>TaskList

" pep8 plugin stuff
let g:pep8_map='<leader>8'

let g:snipMate = { 'snippet_version' : 1 }

" SnipMate shortcut
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
" Uncomment when you figure out x11 thing. This allows for Ctrl+c to copy to clipboard.
"map <C-c> \"+y<CR> 

set clipboard=unnamed

" Pathogen plugin manager stuff:
"call pathogen#infect()

" NERDTree Stuff:
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ropevim
let ropevim_vim_completion=1

" Session settings
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
let g:PathToSessions = $HOME . "/.vim/sessions/"
function MkSesh(...)
  let fname = a:0 > 0 ? a:1 : ""
  if fname != ""
    exe "mksession! " . g:PathToSessions . "lastsesh" . fname . ".vim"
  else
    exe "mksession! " . g:PathToSessions . "lastsesh.vim"
  endif
endfunction
com -nargs=* MkSesh call MkSesh(<q-args>)

" Renumber proto defs.
function! Pnum(...) range
    let idx = a:0 > 0 ? a:1 : 1
    for linenum in range(a:firstline, a:lastline)
        " set index of the attribute.
        let curr_line = getline(linenum)
        if curr_line =~ '\s\d\+;'
            let replacement = substitute(curr_line, '\s\d\+;', ' '.idx.';', 'g')
            call setline(linenum, replacement)
            let idx += 1
        endif
    endfor
endfunction
com -nargs=* -range Pnum <line1>,<line2>call Pnum(<f-args>)

" VUNDLE:
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'wincent/Command-T'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'tpope/vim-surround'
Bundle 'taglist.vim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'SuperTab'
Bundle 'pep8'
Bundle 'fugitive.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'python-rope/ropevim'
Bundle 'The-NERD-Commenter'
Bundle 'chapa'
Bundle 'airblade/vim-gitgutter'
Bundle 'unimpaired.vim'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Set column color for gitgutter
highlight clear SignColumn

" Turn Off comment continuation.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turn off autostart for instant_markdown_d
let g:instant_markdown_autostart = 0
