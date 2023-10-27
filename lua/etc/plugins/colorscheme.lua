local M = {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
}

M.name = 'catppuccin'

function M.config()
	require("catppuccin").setup({
		flavour = "macchiato",
		integrations = {
			mason = true,
		}
	})

	vim.cmd.colorscheme(M.name)
end

return M
