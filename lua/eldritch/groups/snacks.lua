local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    SnacksDashboardHeader   = { fg = c.green },
    SnacksDashboardFooter   = { fg = c.dark_cyan },
    SnacksDashboardIcon     = { fg = c.cyan },
    SnacksDashboardDesc     = { fg = c.cyan },
    SnacksDashboardKey      = { fg = c.purple },
    SnacksDashboardTitle    = { fg = c.cyan },
    SnacksNotifierInfo      = { fg = c.info },
    SnacksNotifierWarn      = { fg = c.warning },
    SnacksNotifierDebug     = { fg = c.comment },
    SnacksNotifierError     = { fg = c.error },
    SnacksNotifierTrace     = { fg = c.green },
  }
end

return M
