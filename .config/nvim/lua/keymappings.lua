vim.g.mapleader = ' '

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

-- improved keyboard support for navigation (especially terminal)
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', {noremap = true})

-- Change 2 split windows from vert to horiz or horiz to vert
vim.api.nvim_set_keymap('n', '<leader>th', '<C-w>t<C-w>H', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tk', '<C-w>t<C-w>K', {noremap = true})

-- Make adjusting split sizes a bit more friendly
vim.cmd([[
    noremap <silent> <C-Left> :vertical resize +3<CR>
    noremap <silent> <C-Right> :vertical resize -3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'Q', '<Nop>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>fs', ':lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require(\'telescope.builtin\').find_files()<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>fw', ':lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand("<cword>") }<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require(\'telescope.builtin\').buffers()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vh', ':lua require(\'telescope.builtin\').help_tags()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gwl', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gwc', ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>', {noremap = true})

-- Tagbar
vim.api.nvim_set_keymap('n', '<Leader>hl', ':nohl<CR>', {noremap = true})

-- Vim Test
vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':TestLast<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g', ':TestVisit<CR>', {noremap = true})

-- LSP
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent> rn <cmd>lua vim.lsp.buf.rename()<CR>")
vim.cmd("nnoremap <silent> ff <cmd>lua vim.lsp.buf.formatting()<CR>")

vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- -- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- -- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Yank until end of line
vim.api.nvim_set_keymap('n', 'Y', 'yg$', {noremap = true, silent = true})
-- Next item, but center line
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true, silent = true})
-- Join line but keep cursor intact
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true, silent = true})
