local M = {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {'williamboman/mason.nvim'},
    {
      'ahmedkhalf/project.nvim',
      config = function()
	require('project_nvim').setup({
	  patterns = { 'package.json' },
	  detection_methods = { 'pattern' },
	})
      end,
      event = 'CmdlineEnter',
      dependencies = {
	{
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  dependencies = {'nvim-lua/plenary.nvim'},
	  config = function()
	    require('telescope').load_extension('projects')
	  end,
	  event = 'CmdlineEnter',
	},
      },
    },
  },
}

M.config = function()
  require('dashboard').setup {
    theme = 'doom',
    config = {
      disable_move = true,
      week_header = {
	enable = true,
      },
      center = {
	{
	  icon = ' ',
	  desc = 'Projects',
	  key = 'p',
	  keymap = ':Telescope projects',
	  action = 'Telescope projects'
	},
	{
	  icon = ' ',
	  desc = 'Recent',
	  key = 'r',
	  keymap = ':Telescope oldfiles',
	  action = 'Telescope oldfiles'
	},
	{
	  icon = ' ',
	  desc = 'Settings',
	  key = 's',
	  keymap = ':edit $MYVIMRC',
	  action = 'edit $MYVIMRC'
	},
	{
	  icon = '󰒲 ',
	  desc = 'Lazy',
	  key = 'l',
	  keymap = ':Lazy',
	  action = 'Lazy'
	},
	{
	  icon = '󰺾 ',
	  desc = 'Mason',
	  key = 'm',
	  keymap = ':Mason',
	  action = 'Mason'
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
