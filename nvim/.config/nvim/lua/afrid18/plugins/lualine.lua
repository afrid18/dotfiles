return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        theme = "jellybeans",
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          {
            color = { fg = "#ff9e64" },
          }
        },
        lualine_a = {
          {
            'buffers',
          }
        }
      },
    })
  end,
}
