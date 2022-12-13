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

-- Tree-sitter does syntax highlighting and folding
--[[
require('nvim-treesitter.configs').setup {
  -- This requires we use a HEAD build of neovim from homebrew that doesn't include the lua parser
  ensure_installed = { 'lua' },
  highlight = {
    disable = true,
  },
  indent = {
    enable = true,
  },
}
]]--

-- Mason manages LSPs
require('mason').setup {}
require("mason-lspconfig").setup {}

-- Sumneko LSP for Lua
require('lspconfig').sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

require('cmp').setup {

}
