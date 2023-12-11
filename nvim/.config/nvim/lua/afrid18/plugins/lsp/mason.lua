return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of language servers for mason to install
      ensure_installed = {
        -- "efm",
        "emmet_ls",
        "html",
        "lua_ls",
        "marksman",
        "pyright",
        "tsserver",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "prettier", -- prettier formatter
        "ruff",     -- python formatter
        "stylua",   -- lua formatter

        -- Linters --
        "eslint_d", -- js linter
        "flake8",   -- python linter
        "pylint",   -- python linter
        "cpplint"   -- c++ linter
      },
    })
  end,
}
