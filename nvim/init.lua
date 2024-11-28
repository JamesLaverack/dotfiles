-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Display line numbers
vim.wo.number = true

-- Display whitespace characters
vim.opt.showbreak = "↪"
vim.opt.list = true
vim.opt.listchars:append "space:⋅"

-- Shortcuts to avoid CTRL- bindings, which I find annoying
vim.keymap.set('n', '<leader>w', '<c-w>', {desc = "Windows", remap = true})

require("lazy").setup({
  spec = {
    {
      "Mofiqul/dracula.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd [[colorscheme dracula]]
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      opts = {
        options = {
          -- Use the dracula theme for lualine
          theme = 'dracula',
        }
      },
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
      "nvim-tree/nvim-tree.lua",
      opts = {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        modified = {
          enable = true,
        },
      },
      keys = {
        {
          "<leader>t",
          function()
            require("nvim-tree.api").tree.focus()
          end,
          desc = "Focus Tree",
        },
      },
    },
    {
      "nvim-tree/nvim-web-devicons"
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

