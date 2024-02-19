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
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")

-- buffer close
vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>")

-- move selected line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cargo commands
vim.keymap.set("n", "<leader>cr", "<cmd>!cargo run<CR>")
vim.keymap.set("n", "<leader>cc", "<cmd>!cargo clippy<CR>")

-- Easy Align remap
vim.keymap.set("v", "t,", "<cmd>EasyAlign ,<CR>")
vim.keymap.set("v", "t=", "<cmd>EasyAlign =<CR>")

-- Oil remap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
