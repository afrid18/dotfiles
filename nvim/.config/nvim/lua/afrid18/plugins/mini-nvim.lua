vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

---- mini files ----
require('mini.files').setup({
  mappings = {
    go_in = "<CR>",
    go_in_plus = "L",
    go_out = "_",
    go_out_plus = "H",
  },
})

vim.keymap.set('n', '-', "<cmd>lua MiniFiles.open()<CR>", {desc = "Toggle mini file explorer"})
vim.keymap.set('n', '<leader>-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  MiniFiles.reveal_cwd()
end, {desc = "Toggle into currently opened file in mini files" })


----- mini.notify ------
local MiniNotify = require('mini.notify')
require('mini.notify').setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  }
})

------ mini cmdline completion ------
-- require('mini.cmdline').setup({
--   autocorrect = { enable = false }
-- })

------ mini.surround ------
require('mini.surround').setup()
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |


---- mini picker -----
local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')
MiniPick.setup()
MiniExtra.setup()

---- keymaps
vim.keymap.set('n', '<leader>pf', function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set('n', '<leader>ps', function() MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') }) end, {desc = "Grep word/search word" })
vim.keymap.set('n', '<leader>vh', function() MiniPick.builtin.help() end, { desc = "Mini Help" })
