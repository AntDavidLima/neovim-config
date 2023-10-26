local M = {
	'famiu/bufdelete.nvim',
	keys = { 'Q' }
}

M.config = function()
	vim.keymap.set('n', 'Q', vim.cmd.Bdelete)
end

return M
