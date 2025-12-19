local M = {}

M.url = "https://github.com/supermaven-inc/supermaven-nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  local ret = {
    SupermavenSuggestion = { fg = c.terminal_black },
  }
  return ret
end

return M
