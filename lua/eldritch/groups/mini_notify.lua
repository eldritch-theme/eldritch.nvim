local M = {}

M.url = "https://github.com/echasnovski/mini.notify"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniNotifyBorder = "FloatBorder",
    MiniNotifyNormal = "NormalFloat",
    MiniNotifyTitle = "FloatTitle",
  }
end

return M
