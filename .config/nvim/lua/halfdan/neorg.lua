local neorg = require("neorg")

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          work = "~/org/work",
          home = "~/org/home",
        }
      }
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.concealer"] = {},
    ["core.journal"] = {
      config = {
        strategy = "flat",
      },
    },
    ["core.integrations.telescope"] = {},
  }
})
