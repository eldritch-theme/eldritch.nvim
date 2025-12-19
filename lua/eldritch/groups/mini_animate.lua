local M = {}

M.url = "https://github.com/echasnovski/mini.animate"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = "NormalFloat",
  }
end

return M
