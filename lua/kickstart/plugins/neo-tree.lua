-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- neo-tree pulls in ~40ms of Lua; defer that until the first time the tree is
-- opened. `setup()` runs on every toggle (a no-op-ish re-merge once loaded) so
-- config edits apply after `:source` without a full restart. The mapping toggles
-- directly rather than relying on neo-tree's own buffer-local `\` binding, which
-- isn't applied when setup runs this late.
local function toggle()
  require('neo-tree').setup({
    filesystem = {
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
  })

  if vim.bo.filetype == 'neo-tree' then
    vim.cmd 'Neotree close'
  else
    vim.cmd 'Neotree reveal'
  end
end

vim.keymap.set('n', '\\', toggle, { desc = 'NeoTree reveal / close', silent = true })
