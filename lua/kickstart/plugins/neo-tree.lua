-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- `setup()` only stores config + wires autocmds (~cheap); the expensive source
-- loading is deferred by neo-tree itself until the tree is first opened. Run it
-- now, though, so `hijack_netrw_behavior` is in effect before the directory
-- buffer's BufEnter fires -- otherwise `nvim <dir>` pops the tree open on its own.
require('neo-tree').setup {
  -- Only open when asked (the `\` mapping / `:Neotree`), never by opening a folder.
  filesystem = {
    hijack_netrw_behavior = 'disabled',
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

local function toggle()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd 'Neotree close'
  else
    vim.cmd 'Neotree reveal'
  end
end

vim.keymap.set('n', '\\', toggle, { desc = 'NeoTree reveal / close', silent = true })
