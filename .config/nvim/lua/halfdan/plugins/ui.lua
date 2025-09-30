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
}
