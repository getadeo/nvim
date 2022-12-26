vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- window navigations
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- buffer hidden
vim.o.hidden = true

-- buffer navigations
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>")

-- buffer close
vim.keymap.set("n", "<leader>w", "<cmd>bd<cr>")
