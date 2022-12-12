-- Call out to packer.nvim to load plugins
require('plugins')

-- Visual Theme
vim.cmd[[colorscheme dracula]]

-- Lualine, along with it's theme information
require('lualine').setup {
  options = {
    theme = 'dracula',
  }
}

-- Enable which-key with default settings
require('which-key').setup {}
