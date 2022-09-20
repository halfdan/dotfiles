local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- better window movement
-- nnoremap('<C-h>', '<C-w>h')
-- nnoremap('<C-j>', '<C-w>j')
-- nnoremap('<C-k>', '<C-w>k')
-- nnoremap('<C-l>', '<C-w>l')

-- resize with arrows
nnoremap('<C-Up>', ':resize -2<CR>')
nnoremap('<C-Down>', ':resize +2<CR>')
nnoremap('<C-Left>', ':vertical resize -2<CR>')
nnoremap('<C-Right>', ':vertical resize +2<CR>')

-- improved keyboard support for navigation (especially terminal)
nnoremap('<leader>h', '<C-w>h')
nnoremap('<leader>j', '<C-w>j')
nnoremap('<leader>k', '<C-w>k')
nnoremap('<leader>l', '<C-w>l')
nnoremap('<A-h>', '<C-w>h')
nnoremap('<A-j>', '<C-w>j')
nnoremap('<A-k>', '<C-w>k')
nnoremap('<A-l>', '<C-w>l')

-- Change 2 split windows from vert to horiz or horiz to vert
nnoremap('<leader>th', '<C-w>t<C-w>H')
nnoremap('<leader>tk', '<C-w>t<C-w>K')

-- Make adjusting split sizes a bit more friendly
vim.cmd([[
    noremap <silent> <C-Left> :vertical resize +3<CR>
    noremap <silent> <C-Right> :vertical resize -3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>
]])

-- better indenting
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Tab switch buffer
nnoremap('<TAB>', ':bnext<CR>')
nnoremap('<S-TAB>', ':bprevious<CR>')

-- Quickfix list
nnoremap('[q', ':cprev<CR>')
nnoremap(']q', ':cnext<CR>')

-- Move selected line / block of text in visual mode
xnoremap('J', ':move \'>+1<CR>gv-gv')
xnoremap('K', ':move \'<-2<CR>gv-gv')

nnoremap('Q', '<Nop>')

-- Tagbar
nnoremap('<Leader>hl', ':nohl<CR>')

-- Vim Test
nnoremap('<leader>tt', ':TestNearest<CR>')
nnoremap('<leader>tT', ':TestFile<CR>')
nnoremap('<leader>ta', ':TestSuite<CR>')
nnoremap('<leader>tl', ':TestLast<CR>')
nnoremap('<leader>tg', ':TestVisit<CR>')

-- Reload init.lua
nnoremap('<leader>sv', ':source $MYVIMRC<CR>')

vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- -- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- -- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Yank until end of line
nnoremap('Y', 'yg$')
-- Next item, but center line
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
-- Join line but keep cursor intact
nnoremap('J', 'mzJ`z')
