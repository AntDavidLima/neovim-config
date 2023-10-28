local M = {
	'lewis6991/gitsigns.nvim',
	event = 'BufEnter',
}

M.config = function ()
	require('gitsigns').setup({
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 0,
			virt_text_pos = 'right_align',
		},
	})
end

return M
