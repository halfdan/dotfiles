return {
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "4da2159b3f3420d43613f43e159f4253b8544474", -- Pin Neorg to the latest stable release
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
                    ["core.completion"] = {
                        config = { engine = { module_name = "external.lsp-completion" } },
                    },
                    ["core.concealer"] = {},
                    ["core.journal"] = {
                        config = {
                            strategy = "flat",
                        },
                    },
                    ["core.integrations.telescope"] = {},
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = true,
                        },
                    },
                    ["external.interim-ls"] = {
                      config = {
                          -- default config shown
                          completion_provider = {
                              -- Enable or disable the completion provider
                              enable = true,

                              -- Show file contents as documentation when you complete a file name
                              documentation = true,

                              -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
                              categories = false,

                              -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
                              -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
                              people = {
                                  enable = false,

                                  -- path to the file you're like to use with the `{@x` syntax, relative to the
                                  -- workspace root, without the `.norg` at the end.
                                  -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                                  -- Note that this will change with your workspace, so it fails silently if the file
                                  -- doesn't exist
                                  path = "people",
                              }
                          }
                      }
                  },
                }
            })
        end,
    },
    { 'nvim-neorg/neorg-telescope' , 'benlubas/neorg-interim-ls' },
}
