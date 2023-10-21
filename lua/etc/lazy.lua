local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("etc.plugins", {
  defaults = {
    lazy = true,
  },
  checker = {
    enabled = true,
    frequency = 86400 -- 24 hours in seconds,
  },
  install = {
    colorscheme = {
      require("etc.plugins.colorscheme").name,
    },
  },
})

vim.keymap.set("n", "<leader>z", vim.cmd.Lazy)
