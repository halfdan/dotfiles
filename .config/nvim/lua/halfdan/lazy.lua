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


    {'preservim/tagbar'},

    -- Status Line and Bufferline
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {'kyazdani42/nvim-web-devicons'}
    },

    {'rcarriga/nvim-notify'},

    -- { "nvim-neorg/neorg" },
    -- {'nvim-neorg/neorg-telescope'},

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
            require('lspsaga').setup({})
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
          nextls = {enable = false},
          credo = {},
          elixirls = {
            enable = true,
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
    {'gruvbox-community/gruvbox'},
    {'luisiacc/gruvbox-baby'},
    {
      'https://gitlab.com/__tpb/monokai-pro.nvim',
      as = 'monokai-pro.nvim'
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
