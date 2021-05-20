require('globals')
require('keymappings')
require('settings')
-- Convert to lua
vim.cmd('source ~/.config/nvim/vim-plug/plugins.vim')

require('colorscheme')

require('lsp')
require('lsp.docker-ls')
require('lsp.python-ls')
require('lsp.julia-ls')
require('lsp.json-ls')
require('lsp.elixir-ls')
require('lsp.go-ls')
require('lsp.terraform-ls')

require('plugins.telescope')
require('plugins.compe')
require('plugins.which-key')
