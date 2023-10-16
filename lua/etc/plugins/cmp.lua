local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    dependencies = {
      {
	'rafamadriz/friendly-snippets',
	config = function()
	  require('luasnip.loaders.from_vscode').lazy_load()
	end,
      },
      {'saadparwaiz1/cmp_luasnip'},
    }
  }
}

M.config = function()
  local cmp = require('cmp')
  local luasnip = require("luasnip")

  -- local has_words_before = function()
  --   unpack = unpack or table.unpack
  --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  -- end

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
	  -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
	  -- that way you will only jump inside the snippet region
	  elseif luasnip.expand_or_locally_jumpable() then
	    luasnip.expand_or_jump()
	  -- elseif has_words_before() then
	  --  cmp.complete()
	  else
	    fallback()
	  end
	end
      )
    }),

    sources = cmp.config.sources({
      { name = 'luasnip' },
    }),
  })
end

return M