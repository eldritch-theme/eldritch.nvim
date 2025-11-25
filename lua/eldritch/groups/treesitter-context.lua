local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  local Util = require("eldritch.util")
  -- stylua: ignore
  return {
    TreesitterContext = { bg = Util.blend_bg(c.fg_gutter, 0.8) },
  }
end

return M
