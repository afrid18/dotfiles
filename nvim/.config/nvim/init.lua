-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- enable vim ui2
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    target = 'cmd',
    pager = { height = 0.5 },
    dialog = { height = 0.5 },
    cmd  = { height = 0.5 },
    msg= { height = 0.5, timeout = 4500 },
  },
})

-- My global commands
vim.g.COLOR = '#171717'

-- All other requires
require("afrid18.keymaps")
require("afrid18.options")
require("afrid18.commands")
-- require("afrid18.lazy")
require("afrid18.autocmd")
require("afrid18.plugins")



-- Temporary config; to be deleted after sometime
-- vim.lsp.config('clangd', {
--   cmd = { 'clangd' },
--   filetypes = { 'c', 'h'},
-- })

-- vim.pack.add {
--   { src = 'https://github.com/neovim/nvim-lspconfig'},
-- }
-- 
-- vim.lsp.enable({ 'clangd' })
-- 
-- 
-- vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
-- 
-- vim.o.autocomplete = true
-- 
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(ev)
--     local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--     end
--   end,
-- })
