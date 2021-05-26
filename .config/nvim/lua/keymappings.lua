vim.g.mapleader = ' '

-- TODO find better place
vim.g.floaterm_open_command = 'vsplit'

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
--vim.cmd([[
    --tnoremap <C-h> <C-\><C-N><C-w>h
    --tnoremap <C-j> <C-\><C-N><C-w>j
    --tnoremap <C-k> <C-\><C-N><C-w>k
    --tnoremap <C-l> <C-\><C-N><C-w>l
    --inoremap <C-h> <C-\><C-N><C-w>h
    --inoremap <C-j> <C-\><C-N><C-w>j
    --inoremap <C-k> <C-\><C-N><C-w>k
    --inoremap <C-l> <C-\><C-N><C-w>l
    --tnoremap <Esc> <C-\><C-n>
--]])

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- improved keyboard support for navigation (especially terminal)
vim.cmd([[
    nnoremap <leader>h <C-w>h
    nnoremap <leader>j <C-w>j
    nnoremap <leader>k <C-w>k
    nnoremap <leader>l <C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
]])

-- Change 2 split windows from vert to horiz or horiz to vert
vim.cmd([[
    map <leader>th <C-w>t<C-w>H
    map <leader>tk <C-w>t<C-w>K
]])

-- Make adjusting split sizes a bit more friendly
vim.cmd([[
    noremap <silent> <C-Left> :vertical resize +3<CR>
    noremap <silent> <C-Right> :vertical resize -3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>
]])

-- FloatTerm
vim.cmd([[
    nnoremap   <silent>   <F9>    :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
    tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=
    nnoremap   <silent>   <F8>    :FloatermPrev<CR>
    tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
    nnoremap   <silent>   <F10>    :FloatermNext<CR>
    tnoremap   <silent>   <F10>    <C-\><C-n>:FloatermNext<CR>
    inoremap   <silent>   <F11>   <C-c>:FloatermToggle<CR>
    nnoremap   <silent>   <F11>   :FloatermToggle<CR>
    tnoremap   <silent>   <F11>   <C-\><C-n>:FloatermToggle<CR>
    tnoremap   <silent>   <M-o>   <C-\><C-n><CR>
    nnoremap   <C-c><C-c> :FloatermSend<CR>
    vnoremap   <C-c><C-c> :FloatermSend<CR>
]])


-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})


-- vim.cmd([[
--     if !exists('g:vscode')
--         " Automatic formatting for Julia files
--         autocmd FileType julia nnoremap <buffer> <c-f> :JuliaFormatterFormat<cr>

--         " Maps quit
--         noremap <leader>q :q<cr>

--         " Maps quit all  
--         noremap <c-q> :qa<cr>

--         " Maps write
--         nnoremap <leader>w :w<cr>
--     end
-- ]])
