return {
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require('neorg').setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/org/work",
                                home = "~/org/home",
                            },
                            index = "index.norg",
                        }
                    },
                    -- ["core.completion"] = {
                    --   config = {
                    --     engine = "nvim-cmp",
                    --   },
                    -- },
                    ["core.concealer"] = {},
                    ["core.journal"] = {
                        config = {
                            strategy = "flat",
                        },
                    },
                    ["core.integrations.telescope"] = {},
                }
            })
        end,
    },
    { 'nvim-neorg/neorg-telescope' },
}
