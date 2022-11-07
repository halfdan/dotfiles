O = {
  auto_close_tree = 0,
  auto_complete = true,
  background = 'dark',
  ignorecase = 'smartcase',
  clipboard = 'unnamedplus',
  incsearch = true,
  termguicolors = true,
  colorscheme = 'monokaipro',
  hidden_files = true,
  wrap_lines = false,
  number = true,
  relative_number = true,
  shell = 'zsh',
  timeoutlen = 500,
  scrolloff = 8,
  noshowmode = true,
  splitright = true,
  splitbelow = true,

  database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
