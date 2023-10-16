local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.cmd([[colorscheme catppuccin-macchiato]])
end

return M
