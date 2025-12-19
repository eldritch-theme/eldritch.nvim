local M = {}

M.url = "https://github.com/echasnovski/mini.clue"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniClueBorder = "FloatBorder",
    MiniClueDescGroup = "DiagnosticFloatingWarn",
    MiniClueDescSingle = "NormalFloat",
    MiniClueNextKey = "DiagnosticFloatingHint",
    MiniClueNextKeyWithPostkeys = "DiagnosticFloatingError",
    MiniClueSeparator = "DiagnosticFloatingInfo",
    MiniClueTitle = "FloatTitle",
  }
end

return M
