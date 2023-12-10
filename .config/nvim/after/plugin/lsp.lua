if vim.g.vscode then
  return
end

local Remap = require("halfdan.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

vim.fn.sign_define("DiagnosticSignError",  {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",   {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",   {text = "", texthl = "DiagnosticSignInfo"})
-- vim.fn.sign_define("DiagnosticSignHint",   {text = "", texthl = "DiagnosticSignHint"})

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
  }
)

-- Setup for nvim-notify
vim.lsp.set_log_level(2)

local convert_lsp_log_level_to_neovim_log_level = function(lsp_log_level)
  if lsp_log_level == 1 then
    return 4
  elseif lsp_log_level == 2 then
    return 3
  elseif lsp_log_level == 3 then
    return 2
  elseif lsp_log_level == 4 then
    return 1
  end
end

local levels = {
  "ERROR",
  "WARN",
  "INFO",
  "DEBUG",
  [0] = "TRACE",
}
---@diagnostic disable-next-line: unused-vararg
vim.lsp.handlers["window/showMessage"] = function(_, result, ...)
  if require("vim.lsp.log").should_log(convert_lsp_log_level_to_neovim_log_level(result.type)) then
    vim.notify(result.message, levels[result.type])
  end
end

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}


-- Diagnostic keymaps
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- LSP settings
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)
  nnoremap("gd", "<cmd>Lspsaga peek_definition<CR>")
  nnoremap("<leader>gd", function ()
    vim.lsp.buf.definition()
  end)
  nnoremap("gD", function() vim.lsp.buf.declaration() end)
  nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
  nnoremap("gW", function() vim.lsp.buf.workspace_symbol() end)
  nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
  nnoremap("[d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  nnoremap("]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>")
  nnoremap("gr", function() vim.lsp.buf.references() end)
  nnoremap("<leader>rn", "<cmd>Lspsaga rename<CR>")
  nnoremap("<leader>cl", function() vim.lsp.codelens.run() end)
  nnoremap("<leader>fa", function() vim.lsp.buf.format{async = true} end)
  inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)

  lsp_status.on_attach(client, bufnr)
end

local function config(_config)
  _config = vim.tbl_deep_extend("force", {
    log_level = vim.lsp.protocol.MessageType.Log,
    message_level = vim.lsp.protocol.MessageType.Log,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  }, _config or {})

  -- Set default client capabilities plus window/workDoneProgress
  _config.capabilities = vim.tbl_extend('keep', _config.capabilities or {}, lsp_status.capabilities)

  return _config
end

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  credo = {},
  elixirls = {
    enabled = true,
    settings = elixirls.settings {
      dialyzerEnabled = false,
      enableTestLenses = false,
    },
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end,
  }
}
-- local elixir = require('elixir')
-- elixir.setup(config({
--   -- repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
--   -- branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
--   cmd = {"/opt/elixir-ls/rel/language_server.sh"},
--   settings = elixir.settings({
--     dialyzerEnabled = true,
--     fetchDeps = false,
--     enableTestLenses = true,
--     suggestSpecs = false,
--   }),
--   on_attach = function(client, bufnr)
--     on_attach(client, bufnr)
--
--     local map_opts = { buffer = true, noremap = true}
--
--     -- remove the pipe operator
--     vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", map_opts)
--     -- add the pipe operator
--     vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", map_opts)
--     vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", map_opts)
--   end
-- }))
--
-- Enable the following language servers
local servers = { 'gopls', 'julials', 'rust_analyzer', 'pyright' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(config())
end

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require('rust-tools').setup({
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    }
  },
  server = {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
})

