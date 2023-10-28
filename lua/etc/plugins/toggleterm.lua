local M = {
	'akinsho/toggleterm.nvim',
	keys = { [[<C-\>]], [[<leader>g]] }
}

M.config = function ()
	require('toggleterm').setup({
		size = 8,
		open_mapping = [[<C-\>]],
		start_in_insert =  true,
		direction  =  'horizontal',
		close_on_exit = true,
	})

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = 'lazygit',
		direction = 'float',
	})

	function Toggle_lazygit()
		lazygit:toggle()
	end

	vim.keymap.set('n', '<leader>g', Toggle_lazygit)
end

return M
