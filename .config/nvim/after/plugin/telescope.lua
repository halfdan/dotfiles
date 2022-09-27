local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>pg", function()
  builtin.live_grep()
end)
nnoremap("<C-p>", function()
  if not pcall(builtin.git_files) then
    builtin.find_files()
  end
end)
nnoremap("<Leader>pf", function()
  builtin.find_files()
end)

nnoremap("<Leader>ps", function()
  builtin.lsp_workspace_symbols()
end)
nnoremap("<leader>pw", function()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
  builtin.buffers()
end)
nnoremap("<leader>vh", function()
  builtin.help_tags()
end)

nnoremap("<leader>wc", function()
  require('telescope').extensions.git_worktree.create_git_worktree()
end)
nnoremap("<leader>ws", function()
  require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gc", function()
  builtin.git_branches()
end)
