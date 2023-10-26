local M = {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	event = 'VimEnter'
}

M.config = function()
	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true
		},
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = true,
		renderer = {
			group_empty = true,
			icons = {
				glyphs = {
					git = {
						unstaged = '',
						staged = '',
						unmerged = '',
						renamed = '',
						untracked = '',
						deleted = '',
						ignored = ''
					}
				}
			}
		},
		diagnostics = {
			show_on_dirs = true,
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		modified = {
			enable = true,
		},
		filters = {
			git_ignored = false,
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			local function edit_or_open()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file
					api.node.open.edit()
				end
			end

			vim.keymap.set("n", "l", edit_or_open, opts('Edit or open'))
		end
	})

	vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
end

return M
