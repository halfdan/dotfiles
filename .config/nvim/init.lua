require('globals')
require('keymappings')
require('settings')
require('plugins')

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
require('plugins.telescope-project')
require('plugins.treesitter')
require('plugins.cmp')
require('plugins.which-key')
require('plugins.lualine')
require('plugins.tagbar')
require('plugins.sneak')

require('themes.nord')

require('go').setup()
