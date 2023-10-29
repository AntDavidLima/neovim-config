local M = {
	'ahmedkhalf/project.nvim',
}

M.config = function()
	require('project_nvim').setup({
		patterns = { 'package.json', 'init.lua' },
		detection_methods = { 'pattern' },
	})
end

return M
