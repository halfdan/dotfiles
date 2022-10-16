local neogit = require('neogit')
local nnoremap = require('halfdan.keymap').nnoremap

neogit.setup {
  integrations = {
    diffview = true
  }
}

nnoremap("<leader>gs", function()
    neogit.open({ })
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
