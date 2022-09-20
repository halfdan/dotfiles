require("neotest").setup({
  adapters = {
    require("neotest-vim-test")({ allow_file_types = { "haskell"} }),
    require("neotest-elixir")
  },
})
