if vim.g.vscode then
  return
end

local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>gg", function()
  builtin.live_grep()
end)
nnoremap("<C-p>", function()
  builtin.commands()
end)

nnoremap("<Leader>ff", function()
  require('telescope').extensions.smart_open.smart_open({cwd_only = true})
  -- builtin.find_files({
  --   hidden=true,
  -- })
end)
nnoremap("<Leader>fh", function()
  builtin.find_files{cwd=vim.fn.expand('%:p:h')}
end)

nnoremap("<Leader>fs", function()
  builtin.lsp_workspace_symbols()
end)
nnoremap("<leader>gw", function()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>fb", function()
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


