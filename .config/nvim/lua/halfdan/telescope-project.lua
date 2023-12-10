if vim.g.vscode then
  return
end

-- Global remapping
------------------------------
-- '--color=never',
require'telescope'.load_extension('project')
