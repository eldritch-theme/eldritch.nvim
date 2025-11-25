local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    BlinkCmpDoc              = { fg = c.fg, bg = c.bg_highlight },
    BlinkCmpDocBorder        = { fg = c.green, bg = c.bg_float },
    BlinkCmpGhostText        = { fg = c.fg_gutter_light or c.fg_gutter },
    BlinkCmpKind             = { fg = c.cyan, bg = c.none },
    BlinkCmpLabel            = { fg = c.fg, bg = c.none },
    BlinkCmpLabelDeprecated  = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    BlinkCmpLabelMatch       = { fg = c.bright_cyan, bg = c.none },
    BlinkCmpMenu             = { fg = c.fg, bg = c.bg_highlight },
    BlinkCmpMenuBorder       = { fg = c.green, bg = c.bg },
    BlinkCmpScrollBarThumb   = { fg = c.bg_highlight, bg = c.cyan },
  }

  require("eldritch.groups.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
