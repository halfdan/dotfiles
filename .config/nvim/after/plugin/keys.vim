" Keybindings
let mapleader=";" 

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" improved keyboard support for navigation (especially terminal)
" http://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

if !exists('g:vscode')
    " Auto start NERD tree when opening a directory
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

    " Auto start NERD tree if no files are specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

    " Let quit work as expected if after entering :q the only window left open is NERD Tree itself
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
    nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

    " Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
    nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

    " Toggle NERDTree
    " Can't get <C-Space> by itself to work, so this works as Ctrl - space - space
    " https://github.com/neovim/neovim/issues/3101
    " http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
    "nnoremap <C-Space> :NERDTreeToggle<CR>
    "nmap <C-@> <C-Space>
    nnoremap <silent> <Space> :NERDTreeToggle<CR>

    " toggle tagbar
    nnoremap <silent> <leader>tb :TagbarToggle<CR>

    " toggle line numbers
    nnoremap <silent> <leader>n :set number! number?<CR>

    " toggle line wrap
    nnoremap <silent> <leader>w :set wrap! wrap?<CR>

    " toggle buffer (switch between current and last buffer)
    nnoremap <silent> <leader>bb <C-^>

    " go to next buffer
    nnoremap <silent> <leader>bn :bn<CR>
    nnoremap <C-l> :bn<CR>

    " go to previous buffer
    nnoremap <silent> <leader>bp :bp<CR>
    " https://github.com/neovim/neovim/issues/2048
    nnoremap <C-h> :bp<CR>

    " close buffer
    nnoremap <silent> <leader>bd :bd<CR>

    " kill buffer
    nnoremap <silent> <leader>bk :bd!<CR>

    " list buffers
    nnoremap <silent> <leader>bl :ls<CR>
    " list and select buffer
    nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>


    " Start terminal in insert mode
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    nnoremap <silent> <leader>tt :terminal<CR>
    nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
    nnoremap <silent> <leader>th :new<CR>:terminal<CR>
    tnoremap <C-x> <C-\><C-n><C-w>q


    let s:hidden_all = 0
    function! ToggleHiddenAll()
        if s:hidden_all  == 0
            let s:hidden_all = 1
            set noshowmode
            set noruler
            set laststatus=0
            set noshowcmd
            TagbarClose
            NERDTreeClose
        else
            let s:hidden_all = 0
            set showmode
            set ruler
            set laststatus=2 
            set showcmd
            NERDTree
            " NERDTree takes focus, so move focus back to the right 
            " (note: "l" is lowercase L (mapped to moving right)
            wincmd l
            TagbarOpen
        endif
    endfunction

    nnoremap <silent> <leader>h :call ToggleHiddenAll()<CR>
end
