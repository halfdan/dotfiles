
local function formatted_status()
  local status = require'lsp-status'.status()
  status = string.gsub(status, "%%", "%%%%")
  return status
end


require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'monokai-pro',
    --component_separators = {'', ''},
    --section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {
      {"require'lsp-status'.status()", fmt = function (str)
        return string.gsub(str, "%%", "%%%%")
      end},
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {},
  winbar = {
    lualine_a = {
    },
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_c = { 'filename' },
  }
}
