vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- window navigations
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- buffer hidden
vim.opt.hidden = true

-- buffer navigations
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" } )
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" } )

-- buffer close
keymap.set("n", "<leader>w", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- move selected line
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank current path
keymap.set('n', "<leader>yp", [[<Cmd>let @+=expand('%:p')<CR>]], { desc = "Yank current path" })
