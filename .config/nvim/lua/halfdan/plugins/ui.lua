return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            local monokai_opts = require("halfdan.util").opts("monokai-pro.nvim")
            return {
                float = vim.tbl_contains(monokai_opts.background_clear or {}, "neo-tree"),
                separator = "bubble", -- bubble | triangle
                ---@type any
                colorful = true,
            }
        end,
        config = function(_, opts)
            local lualine_config = require("halfdan.lualine")
            lualine_config.setup(opts)
            lualine_config.load()
        end,
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')

            require('notify').setup({
                background_colour = "#000000",
                max_width = 120,
                max_height = 10,
            })
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { "<C-1>",   "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
            { "<C-2>",   "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
            { "<C-3>",   "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
            { "<C-4>",   "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
            { "<C-5>",   "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
            { "<C-6>",   "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
            { "<C-7>",   "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
            { "<C-8>",   "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
            { "<C-9>",   "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
            { "<S-l>",   "<Cmd>BufferLineCycleNext<CR>",    desc = "Next buffer" },
            { "<S-h>",   "<Cmd>BufferLineCyclePrev<CR>",    desc = "Previous buffer" },
            { "<A-S-l>", "<Cmd>BufferLineMoveNext<CR>",     desc = "Move buffer right" },
            { "<A-S-h>", "<Cmd>BufferLineMovePrev<CR>",     desc = "Move buffer left" },
        },
        opts = function()
            local monokai_opts = require("halfdan.util").opts("monokai-pro.nvim")
            return {
                options = {
                    diagnostics = "nvim_lsp",     -- | "nvim_lsp" | "coc",
                    -- separator_style = "", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
                    separator_style = { "", "" }, -- | "thick" | "thin" | { 'any', 'any' },
                    -- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
                    indicator = {
                        -- icon = " ",
                        -- style = 'icon',
                        style = "underline",
                    },
                    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                    diagnostics_indicator = function(count, _, _, _)
                        if count > 9 then
                            return "9+"
                        end
                        return tostring(count)
                    end,
                    numbers = function(opts)
                        return string.format('%s', opts.raise(opts.ordinal))
                    end,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "EXPLORER",
                            text_align = "center",
                            separator = vim.tbl_contains(monokai_opts.background_clear or {}, "neo-tree"), -- set to `true` if clear background of neo-tree
                        },
                        {
                            filetype = "NvimTree",
                            text = "EXPLORER",
                            text_align = "center",
                            separator = vim.tbl_contains(monokai_opts.background_clear or {}, "nvim-tree"), -- set to `true` if clear background of neo-tree
                        },
                    },
                    hover = {
                        enabled = true,
                        delay = 0,
                        reveal = { "close" },
                    },
                },
            }
        end,
    },
}
