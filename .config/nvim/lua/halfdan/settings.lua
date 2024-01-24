vim.opt.iskeyword:append("-") -- treat dash separated words as a word text object"
vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
vim.opt.inccommand = "split" -- Make substitution work in realtime
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = false -- Display long lines as just one line
-- vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
-- vim.cmd('syntax on') -- syntax highlighting
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
local fcs = vim.opt.fillchars:get()

-- Stolen from Akinsho
local function get_fold(lnum)
	if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return ' ' end
	return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
end 

_G.get_statuscol = function()
	return "%s%=" .. get_fold(vim.v.lnum) .. " %l  "
end


vim.o.statuscolumn = "%!v:lua.get_statuscol()"
vim.o.foldcolumn = '0'
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99 -- Keep folds open by default
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
vim.o.tabstop = 2 -- Insert 4 spaces for a tab
vim.o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
vim.o.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = false -- Makes indenting smart
vim.wo.number = true -- set numbered lines
-- vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 1 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 1000 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.laststatus = 3 -- Set global status bar
vim.b.did_ftplugin = 1
-- Enable telescope theme
-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_background_color = "dark"

vim.g.mapleader = ' '

vim.g.netrw_preview = 1 -- Split preview vertically
vim.g.netrw_alo = 1 -- Show preview window to the right
vim.g.netrw_winsize = 30 -- Have the preview window take up 70%
-- vim.g.netrw_liststyle = 3 -- Use tree style
