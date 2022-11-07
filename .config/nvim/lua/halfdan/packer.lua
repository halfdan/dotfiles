local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
  local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

  local plugin_path = plugin_prefix .. plugin .. "/"
  --	print('test '..plugin_path)
  local ok, err, code = os.rename(plugin_path, plugin_path)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  --	print(ok, err, code)
  if ok then
    vim.cmd("packadd " .. plugin)
  end
  return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

vim.opt.runtimepath:append("~/code/jira.nvim")
return require("packer").startup({
  function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    use 'lewis6991/impatient.nvim'

    use {'TimUntersberger/neogit', requires = {'sindrets/diffview.nvim' } }
    use {'airblade/vim-gitgutter'}
    -- use {'andymass/vim-matchup'}

    -- Load .editorconfig files
    use {'editorconfig/editorconfig-vim'}

    use {'junegunn/vim-easy-align'}

    -- Goodies
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-surround'} -- ✅
    use {'tpope/vim-dispatch'}

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

    -- Testing
    use {'vim-test/vim-test'}
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        "jfpedroza/neotest-elixir",
        "rouge8/neotest-rust",
      }
    }
    use {"nvim-neotest/neotest-vim-test" }


    use {'preservim/tagbar'}
    vim.g.tagbar_ctags_bin = '/usr/local/bin/ctags'

    -- Status Line and Bufferline
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {'rcarriga/nvim-notify'}

    use { "nvim-neorg/neorg" }
    use {'nvim-neorg/neorg-telescope'}
    use{ "mickael-menu/zk-nvim" }

    use {'justinmk/vim-sneak'}

    use {'machakann/vim-highlightedyank'}
    -- let g:highlightedyank_highlight_duration = 100

    -- LSP / Language Server Protocol
    use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
    }

    use {'L3MON4D3/LuaSnip'}
    use {"rafamadriz/friendly-snippets", after="LuaSnip"}

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim',
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp', event = 'CmdlineEnter' },
        {'tzachar/cmp-tabnine', run = './install.sh', after = 'nvim-cmp' },
        {'petertriho/cmp-git', after = 'nvim-cmp'},
      }
    }

    use {'glepnir/lspsaga.nvim'}

    -- Used to display LSP status in Lualine
    use {'nvim-lua/lsp-status.nvim'}

    -- null-ls for a collection of LSP-like plugins
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {'simrat39/symbols-outline.nvim'}
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use { 'numToStr/FTerm.nvim' }

    -- Telescope fuzzy find files/grep
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-dap.nvim'}

    use {'theprimeagen/git-worktree.nvim'}
    use {'theprimeagen/harpoon'}

    -- Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- => Language Support
    use {'rust-lang/rust.vim'}
    use {'simrat39/rust-tools.nvim'}
    use({ "mhanberg/elixir.nvim", requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" }})
    use {'tpope/vim-projectionist'}
    -- use {'JuliaEditorSupport/julia-vim', opt=true}
    -- vim.g.latex_to_unicode_auto = 1

    -- themes & colorschemes
    use {'gruvbox-community/gruvbox'}
    use {'luisiacc/gruvbox-baby'}
    use {
      'https://gitlab.com/__tpb/monokai-pro.nvim',
      as = 'monokai-pro.nvim'
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})

