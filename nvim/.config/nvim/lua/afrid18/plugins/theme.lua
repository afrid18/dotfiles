-- return {
--   "CrispyBaccoon/evergarden",
--   -- opts = {
--   --   transparent_background = true,
--   --   contrast_dark = 'soft', -- 'hard'|'medium'|'soft'
--   --   overrides = {},         -- add custom overrides
--   -- },
--   --
--   config = function()
--     vim.cmd [[
--       set termguicolors
--       set background=dark
--       colorscheme evergarden
--       highlight Normal guibg=#171717
--       highlight SignColumn guibg=#171717
--       highlight LineNr guibg=#171717
--       highlight Search guibg=#575454
--     ]]
--   end,
-- }
--
--

return {
  "daschw/leaf.nvim",
  config = function()
    require("leaf").setup({
      underlineStyle = "undercurl",
      commentStyle = "italic",
      functionStyle = "NONE",
      keywordStyle = "NONE",
      statementStyle = "bold",
      typeStyle = "NONE",
      variablebuiltinStyle = "NONE",
      transparent = false,
      colors = {},
      overrides = {},
      theme = "dark", -- default, based on vim.o.background, alternatives: "light", "dark"
      contrast = "high", -- default, alternatives: "medium", "high"
    })
    vim.cmd("colorscheme leaf")
  end
}
