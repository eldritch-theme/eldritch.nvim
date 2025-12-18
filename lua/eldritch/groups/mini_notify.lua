local M = {}

M.url = "https://github.com/echasnovski/mini.notify"

---@type eldritch.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniNotifyBorder = "FloatBorder",
    MiniNotifyNormal = "NormalFloat",
    MiniNotifyTitle = "FloatTitle",
  }
end

return M
