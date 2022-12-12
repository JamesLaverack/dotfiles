require('plugins')

-- Line numbers
vim.cmd [[set number]]

-- Use the dracula theme. It's a bit redundant to turn on true colour mode for
-- this, when my terminal *also* uses dracula. But it's nice for the
-- consistency.
vim.cmd[[colorscheme dracula]]
vim.cmd[[set termguicolors]]

