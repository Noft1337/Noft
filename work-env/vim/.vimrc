source ~/.vim/colors/syntax_colors.vim

set t_Co=256
syntax on
filetype on
filetype plugin on 
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4

" Colorscheme
try
  colorscheme koheler
catch
  colorscheme ron
endtry

" Disable numbers when copying
command! Copy set nonumber norelativenumber
command! Nocopy set number relativenumber
