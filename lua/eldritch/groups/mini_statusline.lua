local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    MiniStatuslineDevinfo = { fg = c.fg_dark, bg = c.fg_gutter },
    MiniStatuslineFileinfo = { fg = c.fg_dark, bg = c.fg_gutter },
    MiniStatuslineFilename = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineInactive = { fg = c.blue, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },
  }
end

return M
