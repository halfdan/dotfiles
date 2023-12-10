require("halfdan.packer")

require("halfdan.settings")

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
  vim.notify = require("notify")

  require("impatient")

  require("halfdan.neogit")
  require("halfdan.neorg")
  require('halfdan.globals')
  require('halfdan.keymap')
  require('halfdan.cmp')
  require('halfdan.luasnip')
  require('halfdan.colorscheme')
  require('halfdan.treesitter')
  require('halfdan.telescope')
  require('halfdan.lualine')

  require('halfdan.autocmds')

  require('halfdan.debugger')
end
