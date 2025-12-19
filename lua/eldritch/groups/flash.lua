local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  return {
    FlashBackdrop = { fg = c.dark3 },
    FlashLabel = { bg = c.magenta2, bold = true, fg = c.fg },
  }
end

return M
