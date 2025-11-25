local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.magenta2, fg = c.fg, bold = true },
    LeapLabelPrimary   = { fg = c.magenta2, bold = true },
    LeapLabelSecondary = { fg = c.purple, bold = true },
    LeapBackdrop       = { fg = c.dark3 },
  }
end

return M
