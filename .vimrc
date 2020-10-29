" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on
colorscheme darkblue
" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
"set softtabstop=4
" when indenting with '>', use 4 spaces
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Display line numbers on the left
set number
" Resize panes with mouse
set mouse=a
" Mouse support in tmux
set ttymouse=sgr
" Allow clang formatting
function FormatFile()
    let l:lines="all"
    py3f /Users/jimmy.orourke/scripts/clang-format.py
endfunction
map <C-K> :call FormatFile()<cr>
imap <C-K> <c-o> :call FormatFile()<cr>
