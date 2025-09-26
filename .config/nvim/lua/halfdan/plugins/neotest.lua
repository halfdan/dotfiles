return {
    -- Testing
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- plugins
            "fredrikaverpil/neotest-golang",
            "jfpedroza/neotest-elixir",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup({
                log_level = vim.log.levels.DEBUG,
                adapters = {
                    require("neotest-elixir")({
                        args = { "--trace" },
                        write_delay = 0,
                    }),
                    require("neotest-rust"),
                    require("neotest-golang")
                },
            })

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
        end
    },
}
