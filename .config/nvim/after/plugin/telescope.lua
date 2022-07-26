local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- Telescope
-- nnoremap('<leader>fs', ':lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>')
-- nnoremap('<Leader>ff', ':lua require(\'telescope.builtin\').find_files()<CR>')

-- nnoremap('<leader>fw', ':lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand("<cword>") }<CR>')
-- nnoremap('<leader>fb', ':lua require(\'telescope.builtin\').buffers()<CR>')
-- nnoremap('<leader>vh', ':lua require(\'telescope.builtin\').help_tags()<CR>')
-- nnoremap('<leader>gwl', ':lua require(\'telescope\').extensions.git_worktree.git_worktrees()<CR>')
-- nnoremap('<leader>gwc', ':lua require(\'telescope\').extensions.git_worktree.create_git_worktree()<CR>')
