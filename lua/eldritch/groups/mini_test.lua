local M = {}

M.url = "https://github.com/echasnovski/mini.test"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },
  }
end

return M
