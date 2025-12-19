local M = {}

M.url = "https://github.com/echasnovski/mini.map"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniMapNormal = "NormalFloat",
    MiniMapSymbolCount = "Special",
    MiniMapSymbolLine = "Title",
    MiniMapSymbolView = "Delimiter",
  }
end

return M
