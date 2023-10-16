local M = {
  'williamboman/mason.nvim',
  keys = { '<Space>m' },
  dependencies = {
    {
      'neovim/nvim-lspconfig',
      event = 'BufEnter',
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' }
  }
}

M.config = function()
  require("mason").setup()
  require("mason-lspconfig").setup()
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


