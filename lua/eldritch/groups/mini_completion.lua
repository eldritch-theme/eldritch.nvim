local M = {}

M.url = "https://github.com/echasnovski/mini.completion"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniCompletionActiveParameter = { underline = true },
  }
end

return M
