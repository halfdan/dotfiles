
call plug#begin()

Plug 'airblade/vim-gitgutter'
" Plug 'andymass/vim-matchup'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/vim-easy-align'

" Multiple cursors for editing
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'edkolev/tmuxline.vim'

Plug 'majutsushi/tagbar'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

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

" Easy commenting for Vim
Plug 'preservim/nerdcommenter'

" Indentation lines
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" NERD Tree - tree explorer
" https://github.com/scrooloose/nerdtree
" http://usevim.com/2012/07/18/nerdtree/
" (loaded on first invocation of the command)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugi
Plug 'Xuyuanp/nerdtree-git-plugin'

" Enforce editor settings
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" Terminal in floating window
Plug 'voldikss/vim-floaterm'

" Telescope fuzzy find files/grep
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

"""""""""""""""""""""""""
" => Language Support
"""""""""""""""""""""""""
Plug 'neoclide/jsonc.vim'

Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

Plug 'JuliaEditorSupport/julia-vim'
let g:latex_to_unicode_auto = 1

" Formatting Julia Files
Plug 'kdheepak/JuliaFormatter.vim'

" themes & colorschemes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'arcticicestudio/nord-vim'
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

Plug 'shaunsingh/moonlight.nvim'

call plug#end()


""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" VIM-FLOATERM
""""""""""""""""""""""""""""""

let g:floaterm_open_command = 'vsplit'

"""""""""""""""""""""
"JULIA FORMATTER
"""""""""""""""""""""

let g:JuliaFormatter_options = {
        \ 'indent'                    : 4,
        \ 'margin'                    : 92,
        \ 'always_for_in'             : v:false,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ }
