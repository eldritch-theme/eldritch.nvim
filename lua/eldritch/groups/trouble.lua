local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText   = { fg = c.fg_dark },
    TroubleCount  = { fg = c.magenta, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = c.bg_float },
  }
end

return M
