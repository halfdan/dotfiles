local actions = require('telescope.actions')

-- Global remapping
require('telescope').setup {
  defaults = {
    -- find_command = { 'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
    file_ignore_patterns = { "_build", "node_modules", "deps", ".git", ".elixir_ls" },
    prompt_prefix = "  ",
    selection_caret = " ",
    entry_prefix = "  ",
    -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
    file_sorter = require 'telescope'.extensions.fzf.get_fzf_sorter,
    -- Developer configurations: Not meant for general override
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        ["<CR>"] = actions.select_default + actions.center

        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        -- ["<C-i>"] = my_cool_custom_action,
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
          ['d'] = actions.delete_buffer
        }, -- n
        i = {
          ['<c-d>'] = actions.delete_buffer
        },
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
}

require('telescope').load_extension("fzf")
require('telescope').load_extension("dap")
require('telescope').load_extension("smart_open")
require('telescope').load_extension("egrepify")
