local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.dark3 },
    FlashLabel    = { bg = c.green, bold = true, fg = c.black },
    FlashCurrent  = { bg = c.bg_highlight, bold = true, fg = c.purple },
    FlashMatch    = { bg = c.bg_highlight, bold = true, fg = c.pink },
  }
end

return M
