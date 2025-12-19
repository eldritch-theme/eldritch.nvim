local M = {}

M.url = "https://github.com/echasnovski/mini.indentscope"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniIndentscopeSymbol = { fg = c.blue1, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
  }
end

return M
