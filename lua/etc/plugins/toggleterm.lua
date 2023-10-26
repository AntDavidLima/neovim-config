local M = {
	'akinsho/toggleterm.nvim',
	keys = { [[<C-\>]] }
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
		start_in_insert =  false,
		direction  =  'horizontal',
		close_on_exit = true,
	})
end

return M
