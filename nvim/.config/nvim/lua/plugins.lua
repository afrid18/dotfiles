local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Gruvbox theme plugin
  use { "ellisonleao/gruvbox.nvim" }

  -- Auto pairs
  use "windwp/nvim-autopairs"

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- lua line
  use 'hoob3rt/lualine.nvim' -- StatusLine
end)
