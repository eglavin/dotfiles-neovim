-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }

-- Nothing to pair until you start typing; load on the first insert.
vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function() require('nvim-autopairs').setup {} end,
})
