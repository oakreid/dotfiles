" Installed packages:
" - jmcantrell/vim-virtualenv
" - psf/black
" - cespare/vim-toml
" - vim-python/python-syntax
" - preservim/nerdtree
" - davidhalter/jedi-vim
" - vim-airline/vim-airline

" enable syntax highlighting
syntax on

" enable filetype detection
filetype plugin indent on

" allows you to deal with multiple unsaved buffers
set hidden

" make backspace, uh, work
set backspace=indent,eol,start

" always use 4 spaces for tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
inoremap <S-Tab> <C-v><Tab>
set list
set listchars=tab:>·

" show line numbers
set number

" highlight search terms
set hlsearch

" store swap files in one location
set directory=~/.vim/swap

" make horizontal scrolling nice
set nowrap
set sidescroll=1

" enable mouse in normal/visual modes
set mouse=nv

" always use system clipboard
set clipboard=unnamedplus

" automatically load changes when a file is changed outside of vim
set autoread

" make formatter wrap lines at 88 characters (not automatically)
set textwidth=88
set formatoptions=cq

"" slight highlight on column 89
"set colorcolumn=89
"highlight ColorColumn ctermbg=233

"" use IJKL like arrow keys 
" noremap i k
" noremap I K
" noremap k j
" noremap K J
" noremap j h
" noremap J H
" noremap h i
" noremap H I

" open and close tabs shortcut
noremap <C-f> :tabnew<CR><C-w>h
noremap <C-q> :tabclose<CR>

" old habits die hard
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>i

" make paste not override your clipboard with any deleted text
xnoremap p "_dP

" make 'delete' keys not override your clipboard with deleted text
noremap x "_x
noremap X "_x
noremap <Del> "_x

" override replace mode with redo
noremap r <C-r>

" scroll left and right shortcuts
noremap <C-l> z20l
noremap <C-h> z20h

" keep text in clipboard even after closing vim (requires installing `xsel`)
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" toggle NERDTree shortcut
noremap <C-b> :NERDTreeToggle<CR>

" start NERDTree when vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif

" open the existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" if another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" close the tab if NERDTree is the only window remaining in it
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" exit vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" show hidden files in NERDTree by default
let g:NERDTreeShowHidden = 1

" set NERDTree default width
let g:NERDTreeWinSize=24

" enable better python syntax highlighting
let g:python_highlight_all = 1

" use tabs instead of buffers w/ jedi goto
let g:jedi#use_tabs_not_buffers = 1

" turn off auto-popup when typing a period
let g:jedi#popup_on_dot = 0

" don't show inline call signatures
let g:jedi#show_call_signatures = 0

" set jedi python env path to the user local install
let g:jedi#environment_path = $VIRTUAL_ENV

" set black python env path to the current virtualenv
let g:black_virtualenv = $VIRTUAL_ENV

" use pep8 python indentation
let g:pyindent_open_paren=shiftwidth()
