local M = {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  dependencies = {
     'nvim-treesitter/nvim-treesitter',
     build = ':TSUpdate',
     event = 'BufEnter',
     dependencies = {
      {'windwp/nvim-ts-autotag'}
     }
  },
}

M.config = function()
  require('nvim-autopairs').setup({
    check_ts = true,
  })
end

return M
