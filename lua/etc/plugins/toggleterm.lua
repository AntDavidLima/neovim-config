local M = {
	'akinsho/toggleterm.nvim',
	event =  'BufEnter',
}

M.config = function ()
	require('toggleterm').setup({
		size =  function (term)
			if term.direction ==  "horizontal" then
				return 8
			elseif term.direction  == "float" then
				return 60
			end
		end,
		open_mapping = [[<C-\>]],
		start_in_insert =  true,
		direction  =  'horizontal',
		close_on_exit = true,
	})
end

return M
