-- This requires packer.nvim to be installed. See https://github.com/wbthomason/packer.nvim for installation
-- instructions but the TL;DR is:
-- $ git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

return require('packer').startup(function(use)
  -- Manage pakcer.nvim with packer.nvim.
  use 'wbthomason/packer.nvim'
  -- Dracula is a visual theme that looks nice IMHO
  use 'Mofiqul/dracula.nvim'
  -- Lualina is a pure-lua implementation of the "statusline" for Vim.
  use 'nvim-lualine/lualine.nvim'
  -- which-key explains what mappings do, because I always forget
  use 'folke/which-key.nvim'
end)

