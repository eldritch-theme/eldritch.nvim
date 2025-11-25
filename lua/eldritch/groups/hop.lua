local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    HopNextKey   = { fg = c.magenta2, bold = true },
    HopNextKey1  = { fg = c.cyan, bold = true },
    HopNextKey2  = { fg = Util.blend_bg(c.cyan, 0.6) },
    HopUnmatched = { fg = c.dark3 },
  }
end

return M
