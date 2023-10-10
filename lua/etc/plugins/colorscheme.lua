local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
}

M.name = "catppuccin-macchiato"

function M.config()
  local status_ok = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
