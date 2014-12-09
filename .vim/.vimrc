" Load Pathogen Plugin
execute pathogen#infect()

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" We're using Vim, not Vi!
set nocompatible

" Turn on line numbers
set nu

syntax on

filetype on
filetype indent on
filetype plugin on

" Use solarized theme parameters
" set background=dark
" Because we're in a 256 colors terminal
" let g:solarized_termcolors=256
" Activate solarized theme
" colorscheme solarized
" Advanced configuration
" let g:solarized_contrast = "high"
" let g:solarized_visibility= "high"

" Distinguished theme
colorscheme distinguished

" Remettre le backspace en fonction
set backspace=indent,eol,start

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Set up syntastic to use puppetlint
"let g:loaded_syntastic_puppet_puppetlint_checker = ['puppetlint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if !exists("s:std_in") | NERDTree | endif

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
