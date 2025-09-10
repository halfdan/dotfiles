if vim.g.vscode then
  return
end

local nnoremap = require('halfdan.keymap').nnoremap
local neotest = require('neotest')
local neotest_ns = vim.api.nvim_create_namespace("neotest")

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require("neotest-elixir")({
      args = { "--trace" },
      write_delay = 0,
    }),
    require("neotest-rust"),
    --    require("neotest-vim-test")({ allow_file_types = { "haskell"} }),
    require("neotest-golang")
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
