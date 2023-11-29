-- return {
--   {
--     "bluz71/vim-nightfly-guicolors",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       -- load the colorscheme here
--       vim.cmd([[colorscheme nightfly]])
--       vim.cmd('highlight ColorColumn guibg=#9e9da1')
--     end,
--     opts = function()
-- 	    vim.g.nightflyTransparent = true
--     end
--   },
-- }
--

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000 ,
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme gruvbox]])
    vim.cmd('highlight ColorColumn guibg=#9e9da1')

    -- Toggle transparent background

    local cmd = vim.cmd

    -- Define a function to toggle the transparency
    local is_transparent = false

    local function toggle_transparent()
      if is_transparent then
        cmd("hi Normal guibg=#282828 guifg=#ebdbb2")
        is_transparent = false
      else
        cmd("hi Normal guibg=NONE ctermbg=NONE guifg=#ebdbb2")
        is_transparent = true
      end
    end

    _G.toggle_transparent = toggle_transparent

    -- Map the function to the key combination <leader>cb
    cmd("nnoremap <leader>cb :lua toggle_transparent()<CR>")

    -- Transparent background setting
    -- vim.cmd("let g:gruvbox_transparent_bg = 1")
    -- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
  end,
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  }
}

-- vim.cmd("colorscheme gruvbox")
