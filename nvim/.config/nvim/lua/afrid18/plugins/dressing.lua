return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]    -- Macro's were not visible
    vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]    -- This is the work around
  end
}
