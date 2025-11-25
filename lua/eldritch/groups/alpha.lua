local M = {}

M.url = "https://github.com/goolord/alpha-nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    AlphaShortcut   = { fg = c.orange },
    AlphaHeader     = { fg = c.cyan },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter     = { fg = c.cyan },
    AlphaButtons    = { fg = c.dark_cyan },
  }
end

return M
