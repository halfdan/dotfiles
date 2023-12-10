if vim.g.vscode then
  return
end

local ok, nls = pcall(require, 'null-ls')

if not ok then
  return
end

nls.setup({
    sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.credo,
    },
})
