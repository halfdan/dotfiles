local neorg = require("neorg")

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/org/work",
                    home = "~/org/home",
                }
            }
        },
        ["core.gtd.base"] = {
            config = {
              workspace = "work",
            },
        },
        ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
        },
        ["core.norg.concealer"] = {},
        ["core.norg.journal"] = {
            config = {
              strategy = "flat",
            },
        },
        ["core.integrations.telescope"] = {},
    }
})
