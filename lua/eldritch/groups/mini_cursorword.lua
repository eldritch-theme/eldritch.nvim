local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniCursorword = { bg = c.fg_gutter },
    MiniCursorwordCurrent = { bg = c.fg_gutter },
  }
end

return M
