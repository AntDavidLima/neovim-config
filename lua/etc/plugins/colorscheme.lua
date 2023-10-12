local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
}

M.name = "catppuccin-macchiato"

function M.config()
  vim.cmd([[colorscheme catppuccin-macchiato]])
end

return M
