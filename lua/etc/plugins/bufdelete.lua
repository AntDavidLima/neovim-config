local M = {
	'famiu/bufdelete.nvim',
	event = 'BufEnter'
}

M.config = function()
	vim.keymap.set('n', 'Q', vim.cmd.Bdelete)
end

return M
