return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    -- on_attach function
    local custom_on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts)
      keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
      keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
      keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
      keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

      -- Telescope and lsp
      local lsp_opts = { noremap = true, silent = true }
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", lsp_opts)       -- show definition, references
      keymap.set("n", "gD", vim.lsp.buf.declaration, lsp_opts)                   -- go to declaration
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", lsp_opts)  -- show lsp definitions
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", lsp_opts)  -- show lsp implementations
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", lsp_opts) -- show lsp type definitions
      -- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, lsp_opts)                   -- smart rename
      keymap.set("n", "[d", vim.diagnostic.goto_prev, lsp_opts)                  -- jump to previous diagnostic in buffer
      keymap.set("n", "]d", vim.diagnostic.goto_next, lsp_opts)                  -- jump to next diagnostic in buffer
      -- keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts) -- show documentation for what is under cursor
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", lsp_opts)                 -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure gopls server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- configure typescript server with plugin
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- Clangd setup
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })
    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- configure markdown server
    lspconfig["marksman"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- configure java server
    lspconfig["jdtls"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = custom_on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
