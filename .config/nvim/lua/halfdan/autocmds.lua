local vim = vim
local api = vim.api

vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])

local format_group = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd(
	{ "BufWinEnter", "BufReadPost" },
	{ pattern = "*", command = "normal zR", group = format_group }
)
