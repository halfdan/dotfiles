
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'edkolev/tmuxline.vim'

Plug 'majutsushi/tagbar'
let g:tagbar_ctags_bin = '/usr/local/Cellar/universal-ctags/HEAD-b743975/bin/ctags'

Plug 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'challenger_deep',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'gitbranch', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
	\   'gitbranch': 'FugitiveHead',
	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
	\ }

Plug 'airblade/vim-rooter'
let g:rooter_manual_only = 1

Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 100

" NERD Tree - tree explorer
" https://github.com/scrooloose/nerdtree
" http://usevim.com/2012/07/18/nerdtree/
" (loaded on first invocation of the command)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Enforce editor settings
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" languages
Plug 'neoclide/jsonc.vim'

Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

Plug 'JuliaEditorSupport/julia-vim'
let g:latex_to_unicode_auto = 1

" themes & colorschemes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'arcticicestudio/nord-vim'
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

call plug#end()

