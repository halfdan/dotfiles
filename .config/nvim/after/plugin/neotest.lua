local nnoremap = require('halfdan.keymap').nnoremap
local neotest = require('neotest')

neotest.setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require("neotest-elixir")({
      args = { "--trace" },
    }),
    require("neotest-rust"),
    --    require("neotest-vim-test")({ allow_file_types = { "haskell"} }),
  },
})

nnoremap("<leader>nt", function()
  neotest.run.run()
end)

nnoremap("<leader>nf", function()
  neotest.run.run(vim.fn.expand("%"))
end)

nnoremap("<leader>nd", function()
  neotest.run.run({ strategy = "dap" })
end)

nnoremap("<leader>ns", function()
  neotest.summary.toggle()
end)
