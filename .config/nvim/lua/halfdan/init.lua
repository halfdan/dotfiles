require("halfdan.settings")

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require("halfdan.lazy")

    require('halfdan.keymap')
    require('halfdan.colorscheme')
    require('halfdan.lualine')

    require('halfdan.autocmds')

    require('halfdan.debugger')
end
