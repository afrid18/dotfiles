-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

--------------------- General Keymaps -------------------

-- move to start and ending of the line
keymap.set({ "n", "v" }, "E", "$")
keymap.set({ "n", "v" }, "B", "^")

-- Indenting
keymap.set("v", "<", "<gv", { silent = true, noremap = true })
keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Show Full File-Path
keymap.set("n", "<leader>pa", "<cmd>echo expand('%:p')<CR>")

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<CR>", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Tab Management
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab



--- config from craftzdog

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
-- keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit ")
keymap.set("n", "tx", ":tabclose<Return>", opts)
keymap.set("n", "tn", ":tabnext<Return>", opts)
keymap.set("n", "tt", ":tabprev<Return>", opts)
keymap.set("n", "tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Buffers movement
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", {
  desc = "Prev buffer",
})

vim.keymap.set("n", "]b", "<cmd>bnext<cr>", {
  desc = "Next buffer",
})

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)


-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)


-- Custom function to copy current (relative for project)filepath
local function copy_relative_path()
  -- Get the current file path
  local file_path = vim.fn.expand('%')
  -- Get the current working directory
  local cwd = vim.fn.getcwd()
  -- Find the relative path
  local relative_path = vim.fn.fnamemodify(file_path, ':.:.')
  -- Copy the relative path to the '+' register (system clipboard)
  vim.fn.setreg('+', relative_path)
  -- Optional: Print a message to confirm the action
  print('Relative path copied: ' .. relative_path)
end
vim.api.nvim_create_user_command('CopyRelativePath', copy_relative_path, {})
vim.api.nvim_set_keymap('n', '<leader>cp', '<cmd>CopyRelativePath<CR>', { noremap = true, silent = true })




-- My most useful and life saver keymaps, etc
-- find and replace globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "find and replace word under cursor globally"})
