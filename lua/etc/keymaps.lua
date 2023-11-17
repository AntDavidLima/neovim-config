vim.g.mapleader = " "

vim.keymap.set("n", "<leader>z", vim.cmd.Lazy)

vim.keymap.set("n", "<C-A-k>", ":resize -2<CR>")
vim.keymap.set("n", "<C-A-j>", ":resize +2<CR>")
vim.keymap.set("n", "<C-A-l>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-A-h>", ":vertical resize +2<CR>")

vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "<leader>p", "p")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]])

vim.keymap.set("t", "<C-A-j>", [[<Cmd> resize -2<CR>]])
vim.keymap.set("t", "<C-A-k>", [[<Cmd> resize +2<CR>]])

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
