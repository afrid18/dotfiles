-- set leader key to space (already setup in root init.lua
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

--------------------- Text Editing Keymaps -------------------

-- Indenting line(s)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Concate line(s) and keep the cursor position unchanged
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- format built in
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
vim.keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
vim.keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
-- keymap.set("n", "<C-m>", "<C-i>", opts)

-- Alt key motions (to move line(s) around file
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

--------------------- Move Around Text  -------------------

-- move to start and ending of the line
vim.keymap.set({ "n", "v" }, "E", "$")
vim.keymap.set({ "n", "v" }, "B", "^")

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "up (wrap-aware)" })

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<CR>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>ch", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- centering after an action
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- without getting yanked
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- Show Full File-Path and copy file path to clipboard (register)
vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })


-- toggle diagnostics when not required
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- Tab Management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
vim.keymap.set("n", "<leader>te", "<cmd>tabnew ", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab Management (Not preferred direct key)
-- keymap.set("n", "te", ":tabedit ")
-- keymap.set("n", "tx", ":tabclose<Return>", opts)
-- keymap.set("n", "tn", ":tabnext<Return>", opts)
-- keymap.set("n", "tt", ":tabprev<Return>", opts)
-- keymap.set("n", "tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Buffers movement
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
-- same as above but with square brackets
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer", })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer", })

-- Window Management
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- split window with leader key
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")
-- Cannot use Control Arrow keys in MacOS (as they are setup for mission control operations)
-- vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })


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


--setup native undotree
vim.keymap.set('n', '<leader>ut', function()
  vim.cmd.packadd('nvim.undotree')
  require('undotree').open()
end, {desc = 'Toggle Builtin Undotree' })


-- My most useful and life saver keymaps, etc
-- find and replace the word under cursor globally 
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "find and replace word under cursor globally"})

-- Restart Neovim v0.12+
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)"})

-- Restart LSP
vim.keymap.set("n", "<leader>lr", function()
    vim.cmd("lsp restart")
    vim.notify("LSP restarted", vim.log.levels.INFO)
end, { desc = "Restart LSP" })
