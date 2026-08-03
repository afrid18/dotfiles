return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    -- keymaps to manage hunks
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git change Hunk" })
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git change Hunk" })
    vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Git change Hunk" })
    -- keymaps to navigate hunks
    vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR><CR>", { desc = "goto next git hunk" })
    vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR><CR>", { desc = "goto next git hunk" })
    -- keymaps to blame
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame Git line" })
    vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git blame" })
  end
}
