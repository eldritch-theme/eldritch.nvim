local M = {}

M.url = "https://github.com/zbirenbaum/copilot.lua"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  local ret = {
    CopilotAnnotation = { fg = c.terminal_black },
    CopilotSuggestion = { fg = c.terminal_black },
  }
  return ret
end

return M
