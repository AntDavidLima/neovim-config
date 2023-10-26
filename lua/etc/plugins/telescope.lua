local M = {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{
			'ahmedkhalf/project.nvim',
			config = function()
				require('project_nvim').setup({
					patterns = { 'package.json', 'init.lua' },
					detection_methods = { 'pattern' },
				})
			end,
		},
	},
}

M.config = function()
	require('telescope').load_extension('projects')
end

return M
