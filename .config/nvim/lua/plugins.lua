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

        -- Multiple cursors for editing
        use {'mg979/vim-visual-multi', branch='master'}

        -- Goodies
        use {'tpope/vim-abolish'}
        use {'tpope/vim-fugitive'}
        use {'tpope/vim-surround'}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        use {'majutsushi/tagbar'}
        vim.g.tagbar_ctags_bin = '/usr/local/bin/ctags'

        -- Status Line and Bufferline
        -- use {"glepnir/galaxyline.nvim"}
        --use {"romgrk/barbar.nvim"}
        use {
            'hoob3rt/lualine.nvim',
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
            'scrooloose/nerdtree', 
            requires = {'ryanoasis/vim-devicons'}
        }

        -- nerdtree-git-plugin - show git status in NERD Tree
        -- https://github.com/Xuyuanp/nerdtree-git-plugi
        use {'Xuyuanp/nerdtree-git-plugin'}


        -- LSP / Language Server Protocol
        use {'neovim/nvim-lspconfig'}
        use {'hrsh7th/nvim-compe'}
        use {'glepnir/lspsaga.nvim'}
        use {'kabouzeid/nvim-lspinstall'}
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

        -- use {'vim-python/python-syntax', ft={'python'}, opt=true}
        -- let g:python_highlight_all = 1

        use {'JuliaEditorSupport/julia-vim', opt=true}
        vim.g.latex_to_unicode_auto = 1

        -- Formatting Julia Files
        use {'kdheepak/JuliaFormatter.vim'}

        -- themes & colorschemes
        use {'challenger-deep-theme/vim', as='challenger-deep' }
        use {'dracula/vim', as='dracula' }
        use {'shaunsingh/moonlight.nvim', as='moonlight'}

        use {'arcticicestudio/nord-vim'}

        require_plugin('julia-vim')
    end
)
