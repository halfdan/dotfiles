return {
    -- => Language Support
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {
                    enable = false,
                },
                lightbulb = {
                    enable = false,
                }
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'      -- optional
        }
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({})
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'rust-lang/rust.vim' },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    -- Used to display LSP status in Lualine
    { 'nvim-lua/lsp-status.nvim' },
    {
      'daliusd/incr.nvim',
      config = true,
    }
}
