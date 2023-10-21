local M = {
  'williamboman/mason.nvim',
  keys = { '<Space>m' },
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      event = 'BufEnter',
      config = function()
	vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
	vim.keymap.set("n", "<leader>lI", ":LspInstall<CR>")
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist)

	vim.api.nvim_create_autocmd('LspAttach', {
	  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	  callback = function (ev)
	    local opts = { buffer = ev.buf }
	    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	    vim.keymap.set('n', '<space>wl', function()
	      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	    end, opts)
	    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
	    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	    vim.keymap.set('n', '<space>f', function()
	      vim.lsp.buf.format { async = true }
	    end, opts)
	  end
	})

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
	  local hl = "DiagnosticSign" .. type
	  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' }
  }
}

M.config = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { 'lua_ls', 'tailwindcss', 'tsserver' }
  })
  require("mason-lspconfig").setup_handlers {
    function (server_name)
      require("lspconfig")[server_name].setup {
	capabilities = require('cmp_nvim_lsp').default_capabilities()
      }
    end,
  }

  vim.keymap.set("n", "<Space>m", ":Mason<CR>")
end

return M
