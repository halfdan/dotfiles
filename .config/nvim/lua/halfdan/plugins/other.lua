return {

    { 'airblade/vim-gitgutter' },

    -- Load .editorconfig files
    { 'editorconfig/editorconfig-vim' },

    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
          disable_mouse = false,
          max_count = 5
        },
    },
    {
        "karb94/neoscroll.nvim",
        opts = {},
    },
    { 'junegunn/vim-easy-align' },

    -- Goodies
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-dispatch' },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
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
        end
    },

    { 'f-person/git-blame.nvim' },
    {
        'justinmk/vim-sneak',
        config = function()
            vim.g["sneak#label"] = 1
            vim.g["sneak#prompt"] = "🔎"
            vim.g["sneak#s_next"] = 1

            -- Vim-Test
            vim.g["test#strategy"] = "neovim"
            vim.g["test#neovim#term_position"] = "vert rightbelow 80"
        end
    },

    { 'machakann/vim-highlightedyank' },



    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- Your setup opts here
        },
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'tpope/vim-projectionist',
        config = function()
            vim.g.projectionist_heuristics = {
                ["*.go"] = {
                    ["*.go"] = {
                        alternate = "{}_test.go",
                        type = "source",
                    },
                    ["*_test.go"] = {
                        alternate = "{}.go",
                        type = "test",
                    },
                },
            }
        end
    },


}
