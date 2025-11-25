local M = {}

M.url = "https://github.com/ibhagwan/fzf-lua"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FzfLuaNormal     = { fg = c.fg, bg = c.bg_float },
    FzfLuaBorder     = { fg = c.green, bg = c.bg_float },
    FzfLuaSearch     = { fg = c.fg, bg = c.bg_float },
    FzfLuaTitle      = { fg = c.cyan, bg = c.bg_float },
    FzfLuaCursorLine = { bg = c.bg_highlight, fg = c.green },
    FzfLuaFzfPrompt  = { bg = c.bg_float, fg = c.purple },
  }
end

return M
