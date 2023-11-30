-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here

    -- Comment Shortcut keys
    vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false }),
    vim.api.nvim_set_keymap("v", "<C-_>", "gc", { noremap = false }),
  },
  lazy = false,
}
