-- Small startup helpers shared across the config.

local M = {}

--- Run `fn` once, just after startup finishes and the first frame is drawn, so
--- plugin `setup()` calls that only affect appearance or later interaction stay
--- off the critical startup path. If startup is already done (e.g. re-sourcing
--- init.lua), run on the next tick.
---@param fn fun()
function M.on_ui_ready(fn)
  if vim.v.vim_did_enter == 1 then
    vim.schedule(fn)
    return
  end
  vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
      vim.schedule(fn)
    end,
  })
end

return M
