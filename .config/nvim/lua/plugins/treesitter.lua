require('nvim-treesitter.configs').setup({
    ensure_installed = { "python", "go", "julia", "elixir", "rust", "gomod", "json", "lua", "ruby", "yaml" },
    ignore_install = { "haskell" },
    highlight = {
        enable = true
    },
    indent = {
        enable = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
    },
})
