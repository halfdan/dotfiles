
local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Yank until end of line
nnoremap('Y', 'yg$')
-- Next item, but center line
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
-- Join line but keep cursor intact
nnoremap('J', 'mzJ`z')

-- Move selected line / block of text in visual mode
xnoremap('J', ':move \'>+1<CR>gv-gv')
xnoremap('K', ':move \'<-2<CR>gv-gv')

nnoremap('Q', '<Nop>')

-- better indenting
vnoremap('<', '<gv')
vnoremap('>', '>gv')

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

-- Keybindings below this are neovim cli only
if vim.g.vscode then
  -- Toggle Comment
  vim.keymap.set('x', 'gc', '<Plug>VSCodeCommentary', {})
  vim.keymap.set('n', 'gc', '<Plug>VSCodeCommentary', {})
  vim.keymap.set('o', 'gc', '<Plug>VSCodeCommentary', {})
  vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', {})

  return
end

-- resize with arrows
nnoremap('<C-Up>', ':resize -2<CR>')
nnoremap('<C-Down>', ':resize +2<CR>')
nnoremap('<C-Left>', ':vertical resize -2<CR>')
nnoremap('<C-Right>', ':vertical resize +2<CR>')

-- Make adjusting split sizes a bit more friendly
vim.cmd([[
    noremap <silent> <C-Left> :vertical resize +3<CR>
    noremap <silent> <C-Right> :vertical resize -3<CR>
    noremap <silent> <C-Up> :resize +3<CR>
    noremap <silent> <C-Down> :resize -3<CR>
]])

-- Tab switch buffer
nnoremap('<TAB>', ':bnext<CR>')
nnoremap('<S-TAB>', ':bprevious<CR>')

-- Quickfix list
nnoremap('[q', ':cprev<CR>')
nnoremap(']q', ':cnext<CR>')

-- no arrow keys
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

inoremap("<up>", "<nop>")
inoremap("<down>", "<nop>")
inoremap("<left>", "<nop>")
inoremap("<right>", "<nop>")

-- Tagbar
nnoremap('<Leader>hl', ':nohl<CR>')

-- Vim Test
nnoremap('<leader>tt', ':TestNearest<CR>')
nnoremap('<leader>tT', ':TestFile<CR>')
nnoremap('<leader>ta', ':TestSuite<CR>')
nnoremap('<leader>tl', ':TestLast<CR>')
nnoremap('<leader>tg', ':TestVisit<CR>')

-- Vim Projectionist
nnoremap('<leader>a', ':A<CR>')

-- Reload init.lua
nnoremap('<leader>sv', ':source $MYVIMRC<CR>')

nnoremap('<C-p>', ':Lspsaga diagnostic_jump_prev<CR>')
nnoremap('<C-y>', ':Lspsaga diagnostic_jump_next<CR>')

-- Harpoon
nnoremap("<leader>m", function() require("harpoon.mark").add_file() end)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end)
nnoremap("<C-t>", function() require("harpoon.ui").nav_file(2) end)
nnoremap("<C-n>", function() require("harpoon.ui").nav_file(3) end)
nnoremap("<C-s>", function() require("harpoon.ui").nav_file(4) end)

