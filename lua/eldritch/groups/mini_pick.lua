local M = {}

M.url = "https://github.com/echasnovski/mini.pick"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniPickBorder = "FloatBorder",
    MiniPickBorderBusy = "DiagnosticFloatingWarn",
    MiniPickBorderText = { fg = c.hint, bg = c.bg_float },
    MiniPickIconDirectory = "Directory",
    MiniPickIconFile = "MiniPickNormal",
    MiniPickHeader = "DiagnosticFloatingHint",
    MiniPickMatchCurrent = "CursorLine",
    MiniPickMatchMarked = "Visual",
    MiniPickMatchRanges = "DiagnosticFloatingHint",
    MiniPickNormal = "NormalFloat",
    MiniPickPreviewLine = "CursorLine",
    MiniPickPreviewRegion = "IncSearch",
    MiniPickPrompt = { fg = c.info, bg = c.bg_float },
  }
end

return M
