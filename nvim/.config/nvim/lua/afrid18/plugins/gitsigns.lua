return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {desc = "Preview Git change Hunk"})
    vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR><CR>", {desc = "goto next git hunk"})
    vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR><CR>", {desc = "goto next git hunk"})
  end
}
