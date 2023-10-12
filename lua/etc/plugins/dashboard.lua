local M = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
  },
}

M.config = function()
  require('dashboard').setup {
    theme = 'doom',
    config = {
      disable_move,
      week_header = {
	enable = true,
      },
      center = {
	{
	  icon = ' ',
	  icon_hl = 'Title',
	  desc = 'Find File           ',
	  desc_hl = 'String',
	  key = 'b',
	  keymap = 'SPC f f',
	  key_hl = 'Number',
	  action = 'lua print(2)'
	},
      },
    },
  }
end

return M
