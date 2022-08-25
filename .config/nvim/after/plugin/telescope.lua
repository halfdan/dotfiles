local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
  if not pcall(builtin.git_files) then
    builtin.find_files()
  end
end)
nnoremap("<Leader>pf", function()
  builtin.find_files()
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

-- Telescope
-- nnoremap('<leader>fs', ':lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
-- nnoremap('<Leader>ff', ':lua require(\'telescope.builtin\').find_files()<CR>')

-- nnoremap('<leader>fw', ':lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand("<cword>") }<CR>')
-- nnoremap('<leader>fb', ':lua require(\'telescope.builtin\').buffers()<CR>')
-- nnoremap('<leader>vh', ':lua require(\'telescope.builtin\').help_tags()<CR>')
-- nnoremap('<leader>gwl', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>')
-- nnoremap('<leader>gwc', ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>')
