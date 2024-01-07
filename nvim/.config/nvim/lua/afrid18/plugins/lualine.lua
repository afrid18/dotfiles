return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "codedark",
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        -- best to work with multi windows and panes
        globalstatus = true,
      },
    })
  end,
}
