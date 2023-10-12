local M = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {
      'ahmedkhalf/project.nvim',
      config = function()
	require('project_nvim').setup {}
      end,
      dependencies = {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {'nvim-lua/plenary.nvim'},
	config = function()
	  require('telescope').load_extension('projects')
	end
      },
    },
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
	  icon = ' ',
	  desc = 'Projects',
	  key = 'p',
	  keymap = ':Telescore projects',
	  action = 'Telescope projects'
	},
	{
	  icon = '󰿅 ',
	  desc = 'Quit',
	  key = 'q',
	  keymap = ':q',
	  action = 'q'
	},
      },
    },
  }
end

return M
