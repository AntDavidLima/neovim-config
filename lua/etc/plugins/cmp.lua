local M = {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			dependencies = {
				{
					'rafamadriz/friendly-snippets',
					config = function()
						require('luasnip.loaders.from_vscode').lazy_load()
					end,
				},
				{ 'saadparwaiz1/cmp_luasnip' },
			}
		},
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'onsails/lspkind-nvim' },
	}
}

M.config = function()
	local cmp = require('cmp')
	local luasnip = require("luasnip")

	cmp.setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
		},

		mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp.mapping(
				function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end
			),
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<C-k>'] = cmp.mapping.select_prev_item(),
		}),

		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		}),

		formatting = {
			fields = {
				"kind", "abbr", "menu"
			},
			format = require("lspkind").cmp_format({
				menu = ({
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
				}),
				mode = "kind"
			}),
		}

	})
end

return M
