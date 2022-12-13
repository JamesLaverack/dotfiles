-- Call out to packer.nvim to load plugins
require('plugins')

-- Visual Theme
vim.cmd[[colorscheme dracula]]

-- Line Numers
vim.wo.number = true

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

-- Mason manages Language Server Protocol (LSPs). These LSP implementations bring "IDE"
-- features to the editor for the language they are configured for.
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

-- cmp does completion, sourcing completing suggestions from the LSP.
require('cmp').setup {
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'nvim_lsp_signature_help'},
    { name = 'nvim_lua', keyword_length = 2},
    { name = 'buffer', keyword_length = 2 },
  }
}

