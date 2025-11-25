local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/echasnovski/mini.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniIndentscopeSymbol = { fg = c.cyan, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
  }
end

return M
