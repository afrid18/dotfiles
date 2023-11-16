return {
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
      vim.cmd('highlight ColorColumn guibg=#9e9da1')
    end,
    opts = function()
	    vim.g.nightflyTransparent = true
    end
  },
}
