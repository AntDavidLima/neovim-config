local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"creativenull/efmls-configs-nvim",
	},
}

M.config = function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "tailwindcss", "efm", "tsserver" },
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
		["efm"] = function()
			local languages = require("efmls-configs.defaults").languages()

			require("lspconfig").efm.setup(vim.tbl_extend("force", {
				filetypes = vim.tbl_keys(languages),
				settings = {
					rootMarkers = { ".git" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}, {}))
		end,
	})

	vim.keymap.set("n", "<Space>m", ":Mason<CR>")
end

return M
