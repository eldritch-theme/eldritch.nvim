local M = {}

M.url = "https://github.com/echasnovski/mini.files"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniFilesBorder = "FloatBorder",
    MiniFilesBorderModified = "DiagnosticFloatingWarn",
    MiniFilesCursorLine = "CursorLine",
    MiniFilesDirectory = "Directory",
    MiniFilesFile = { fg = c.fg_float },
    MiniFilesNormal = "NormalFloat",
    MiniFilesTitle = "FloatTitle",
    MiniFilesTitleFocused = { fg = c.border_highlight, bg = c.bg_float, bold = true },
  }
end

return M
