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
        globalstatus = true,
      },
    })
  end,
}
