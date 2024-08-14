local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  return
end

require("lazy").setup({
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true
    },
    {'airblade/vim-gitgutter'},

    -- Load .editorconfig files
    {'editorconfig/editorconfig-vim'},

    {'junegunn/vim-easy-align'},

    -- Goodies
    {'tpope/vim-fugitive'},
    {'tpope/vim-surround'}, -- ✅
    {'tpope/vim-dispatch'},

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },

    -- Testing
    {'vim-test/vim-test'},
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        "jfpedroza/neotest-elixir",
        "rouge8/neotest-rust",
      }
    },
    {"nvim-neotest/neotest-vim-test" },
    {'akinsho/toggleterm.nvim', version = "*", config = function()
      require('toggleterm').setup({
        open_mapping = [[<C-\>]],
        start_in_insert = true,
        direction = "horizontal",
        autochdir = false,
        size = 20,
        highlights = {
          FloatBorder = { link = "ToggleTermBorder" },
          Normal = { link = "ToggleTerm" },
          NormalFloat = { link = "ToggleTerm" },
        },
        winbar = {
          enabled = true,
          name_formatter = function(term)
            return term.name
          end,
        },
      })
    end},

    {'preservim/tagbar'},

    {'f-person/git-blame.nvim'},
    -- Status Line and Bufferline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {'kyazdani42/nvim-web-devicons'},
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

      {'rcarriga/nvim-notify'},

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
        end,
      },
      {'nvim-neorg/neorg-telescope'},

      {'justinmk/vim-sneak'},

      {'machakann/vim-highlightedyank'},

      -- LSP / Language Server Protocol
      {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
    },

    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({

              symbol_in_winbar = {
                enable = false,
              },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons'     -- optional
        }
    },

    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim',
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp', event = 'CmdlineEnter' },
        {'petertriho/cmp-git', after = 'nvim-cmp'},
      }
    },

    -- Used to display LSP status in Lualine
    {'nvim-lua/lsp-status.nvim'},

    -- null-ls for a collection of LSP-like plugins
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {'simrat39/symbols-outline.nvim', config=true},
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },

    -- Telescope fuzzy find files/grep
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {
        "fdschmidt93/telescope-egrepify.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-dap.nvim'},
    {
      "danielfalk/smart-open.nvim",
      branch = "0.2.x",
      dependencies = {"kkharji/sqlite.lua"}
    },

    {'numToStr/FTerm.nvim'},
    {'theprimeagen/git-worktree.nvim'},
    {'theprimeagen/harpoon'},

    -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",

    -- => Language Support
    {'rust-lang/rust.vim'},
    {'simrat39/rust-tools.nvim'},
    {
      "elixir-tools/elixir-tools.nvim",
      version = "*",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        local elixir = require("elixir")
        local elixirls = require("elixir.elixirls")
--
        elixir.setup {
          nextls = {enable = true},
          credo = {},
          elixirls = {
            enable = false,
            settings = elixirls.settings {
              dialyzerEnabled = false,
              enableTestLenses = false,
            },
            on_attach = function()
              vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
              vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
              vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
            end,
          }
        }
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    {'tpope/vim-projectionist'},
    -- themes & colorschemes
    -- {'gruvbox-community/gruvbox'},
    { "rose-pine/neovim", name = "rose-pine" },
    {'luisiacc/gruvbox-baby'},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
      keys = {
        { "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
        { "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
        { "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
        { "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
        { "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
        { "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
        { "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
        { "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
        { "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
        { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
        { "<A-S-l>", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
        { "<A-S-h>", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
      },
      opts = function()
        local monokai_opts = require("halfdan.util").opts("monokai-pro.nvim")
        return {
          options = {
            diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
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
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
    }
})
