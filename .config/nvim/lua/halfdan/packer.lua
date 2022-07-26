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

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        use {'TimUntersberger/neogit' }
        use {'airblade/vim-gitgutter'}
        -- use {'andymass/vim-matchup'}

        -- Load .editorconfig files
        use {'editorconfig/editorconfig-vim'}

        use {'junegunn/vim-easy-align'}

        -- Goodies
        use {'tpope/vim-fugitive'}
        use {'tpope/vim-surround'} -- ✅
        use {'tpope/vim-dispatch'} 

        -- Testing
        use {'vim-test/vim-test'}


        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use {'preservim/tagbar'}
        vim.g.tagbar_ctags_bin = '/usr/local/bin/ctags'

        -- Status Line and Bufferline
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons'}
        }


        use {'justinmk/vim-sneak'}

        use {'machakann/vim-highlightedyank'}
        -- let g:highlightedyank_highlight_duration = 100

        -- LSP / Language Server Protocol
        use {
            'neovim/nvim-lspconfig',
            'williamboman/nvim-lsp-installer',
        }
        
        use {'hrsh7th/cmp-nvim-lsp'}
        use {'hrsh7th/cmp-buffer'}
        use {'hrsh7th/cmp-path'}
        use {'hrsh7th/cmp-cmdline'}
        use {'hrsh7th/nvim-cmp'}
        use {'tzachar/cmp-tabnine', run = './install.sh'}
        use {'onsails/lspkind-nvim'} -- Display symbol with cmp suggestions
        use {'L3MON4D3/LuaSnip'} 
        use {'saadparwaiz1/cmp_luasnip'}
        
        use {'glepnir/lspsaga.nvim'}

        -- Used to display LSP status in Lualine
        use {'nvim-lua/lsp-status.nvim'}

        --use {'simrat39/symbols-outline.nvim'}
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }
        -- Telescope fuzzy find files/grep
        use {'nvim-lua/popup.nvim'}
        use {'nvim-lua/plenary.nvim'}
        use {'nvim-telescope/telescope.nvim'}
        use {'nvim-telescope/telescope-project.nvim'}
        use {'nvim-telescope/telescope-fzy-native.nvim'}

        use {'theprimeagen/git-worktree.nvim'}

        -- Debugging
        use("mfussenegger/nvim-dap")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")

        -- => Language Support
        use {'rust-lang/rust.vim'}
        use {'simrat39/rust-tools.nvim'}

        -- Debugger support via dap
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

        use {'JuliaEditorSupport/julia-vim', opt=true}
        vim.g.latex_to_unicode_auto = 1


        -- themes & colorschemes
        use {'arcticicestudio/nord-vim'}
        use {'joshdick/onedark.vim'}
        use {'gruvbox-community/gruvbox'}
        use {'luisiacc/gruvbox-baby'}
    end
)

