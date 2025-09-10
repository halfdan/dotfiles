if vim.g.vscode then
  return
end

-- Sneak
vim.g["sneak#label"] = 1
vim.g["sneak#prompt"] = "🔎"
vim.g["sneak#s_next"] = 1

-- Vim-Test
vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vert rightbelow 80"
