set background=dark
set clipboard+=unnamedplus
" set colorcolumn=80
set ignorecase smartcase
set incsearch
set list listchars=tab:⇒\ ,trail:·
set mouse+=a
set noswapfile
set nowrap
set number
set relativenumber
set scrolloff=8
set termguicolors

" Set tabstop and shiftwidth to 4 spaces
set expandtab ts=4 sw=4 ai

" hide mode as it's shown in lightline
set noshowmode

syntax on

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" colorscheme nord
" colorscheme dracula
colorscheme moonlight

" terminal disable linenumber
au TermOpen * setlocal nonumber norelativenumber
