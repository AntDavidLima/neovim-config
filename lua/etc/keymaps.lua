vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>z", vim.cmd.Lazy)

vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "`", "``<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
