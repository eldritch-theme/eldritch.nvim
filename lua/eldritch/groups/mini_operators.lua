local M = {}

M.url = "https://github.com/echasnovski/mini.operators"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniOperatorsExchangeFrom = "IncSearch",
  }
end

return M
