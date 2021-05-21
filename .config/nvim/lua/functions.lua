-- functions

local M = {}

function M.edit_dotfiles()
    require'telescope.builtin'.git_files {
        shorten_path = false,
        cwd = "~/.dotfiles",
        prompt = "~ dotfiles ~",
        height = 10,

        layout_strategy = 'horizontal',
        layout_options = {
            preview_width = 0.75,
        },
    }
end

return M
