if vim.g.vscode then
  return
end

require('nvim-treesitter').setup({
  ensure_installed = { "python", "go", "elixir", "heex", "rust", "gomod", "json", "lua", "yaml", "norg", "query", "markdown", "markdown_inline", "gleam", "zig", "odin"},
  ignore_install = { "haskell" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
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
