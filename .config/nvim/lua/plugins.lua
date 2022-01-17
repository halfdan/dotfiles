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

        use {'airblade/vim-gitgutter'}
        -- use {'andymass/vim-matchup'}

        -- Load .editorconfig files
        use {'editorconfig/editorconfig-vim'}

        use {'junegunn/vim-easy-align'}

        -- Goodies
        use {'tpope/vim-fugitive'}
        use {'tpope/vim-surround'} -- ✅

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

        -- Easy commenting for Vim
        use {'preservim/nerdcommenter'}

        -- NERD Tree - tree explorer
        -- https://github.com/scrooloose/nerdtree
        -- http://usevim.com/2012/07/18/nerdtree/
        -- (loaded on first invocation of the command)
        use {
            'preservim/nerdtree', 
            requires = {'ryanoasis/vim-devicons'}
        }

        -- nerdtree-git-plugin - show git status in NERD Tree
        -- https://github.com/Xuyuanp/nerdtree-git-plugi
        use {'Xuyuanp/nerdtree-git-plugin'}


        -- LSP / Language Server Protocol
        use {
            'neovim/nvim-lspconfig',
            'williamboman/nvim-lsp-installer',
        }
        --use {'hrsh7th/nvim-compe'}
        
        use {'hrsh7th/cmp-nvim-lsp'}
        use {'hrsh7th/cmp-buffer'}
        use {'hrsh7th/cmp-path'}
        use {'hrsh7th/cmp-cmdline'}
        use {'hrsh7th/nvim-cmp'}
        
        -- use {'glepnir/lspsaga.nvim'} -- Has a bug
        use {'tami5/lspsaga.nvim'}

        use {'nvim-lua/lsp-status.nvim'}
        use {'simrat39/symbols-outline.nvim'}

        -- Terminal in floating window
        use {'voldikss/vim-floaterm'}

        -- Telescope fuzzy find files/grep
        use {'nvim-lua/popup.nvim'}
        use {'nvim-lua/plenary.nvim'}
        use {'nvim-telescope/telescope.nvim'}
        use {'nvim-telescope/telescope-project.nvim'}

        -- Which Key
        use {'folke/which-key.nvim'}

        -- => Language Support
        use {'neoclide/jsonc.vim'}

        use {'ray-x/go.nvim'}
        use {'ray-x/guihua.lua'}

        -- Debugger support via dap
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
        -- use {'vim-python/python-syntax', ft={'python'}, opt=true}
        -- let g:python_highlight_all = 1

        use {'JuliaEditorSupport/julia-vim', opt=true}
        vim.g.latex_to_unicode_auto = 1

        -- Formatting Julia Files
        use {'kdheepak/JuliaFormatter.vim'}

        -- themes & colorschemes
        use {'dracula/vim', as='dracula' }
        use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
        use {'shaunsingh/moonlight.nvim', as='moonlight'}
        use {'arcticicestudio/nord-vim'}
        use {'joshdick/onedark.vim'}
        use {'sainnhe/everforest'}

        require_plugin('julia-vim')
    end
)
