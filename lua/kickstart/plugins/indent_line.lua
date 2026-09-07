-- Add indentation guides even on blank lines

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`
vim.pack.add { 'https://github.com/lukas-reineke/indent-blankline.nvim' }

-- Purely visual; load it after the first frame is on screen.
require('kickstart.util').on_ui_ready(function() require('ibl').setup {} end)
