require('nvim-treesitter.configs').setup({
  ensure_installed = { "python", "go", "elixir", "rust", "gomod", "json", "lua", "ruby", "yaml", "org" },
  ignore_install = { "haskell" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  indent = {
    enable = true,
    disable = { 'org' },
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
