local nnoremap = require('halfdan.keymap').nnoremap
local neotest = require('neotest')

neotest.setup({
  adapters = {
    require("neotest-elixir"),
--    require("neotest-vim-test")({ allow_file_types = { "haskell"} }),
  },
})

nnoremap("<leader>nt", function ()
  neotest.run.run()
end)

nnoremap("<leader>nf", function ()
  neotest.run.run(vim.fn.expand("%"))
end)

nnoremap("<leader>nd", function ()
  neotest.run.run({strategy = "dap"})
end)

