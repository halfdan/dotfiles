if vim.g.vscode then
    return
end

vim.diagnostic.config({
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "", -- optional, you can pick any icon
        },
    },
    virtual_text = true, -- or { prefix = "●" } for customization
    update_in_insert = false,
    severity_sort = true,
})

-- Setup for nvim-notify
vim.lsp.set_log_level(2)
-- Map LSP message types (1=Error, 2=Warning, 3=Info, 4=Log) to vim.log.levels
local severity_map = {
    [1] = vim.log.levels.ERROR,
    [2] = vim.log.levels.WARN,
    [3] = vim.log.levels.INFO,
    [4] = vim.log.levels.DEBUG,
}

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx, _)
    local lvl = severity_map[result.type] or vim.log.levels.INFO
    if vim.lsp.log.should_log(lvl) then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local title = client and ("LSP | " .. client.name) or "LSP"
        vim.notify(result.message, lvl, { title = title })
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
-- Show Lspsaga line diagnostics
vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<CR>', { noremap = true, silent = true })

-- Send diagnostics to location list
vim.keymap.set('n', '<leader>q', function()
    vim.diagnostic.setloclist()
end, { noremap = true, silent = true })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({count=1, float=true})
end, { desc = "Go to next diagnostic" })

vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({count=-1, float=true})
end, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
vim.lsp.enable 'lua_ls'
vim.lsp.enable 'gopls'
vim.lsp.enable 'expert'
vim.lsp.enable 'ruff'
vim.lsp.enable 'pyright'
vim.lsp.enable 'gleam'
