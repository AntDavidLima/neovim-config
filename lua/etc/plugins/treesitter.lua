local M = {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		'windwp/nvim-ts-autotag',
	}
}

M.config = function()
	require('nvim-treesitter.configs').setup({
		ensure_installed = {
			'css',
			'html',
			'javascript',
			'typescript',
			'tsx',
			'lua',
			'yuck',
		},
		highlight = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

return M
