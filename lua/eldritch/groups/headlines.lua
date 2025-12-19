local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/lukas-reineke/headlines.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  local ret = {
    CodeBlock = { bg = c.bg_dark },
    Headline = "Headline1",
  }
  for i, color in ipairs(c.rainbow) do
    ret["Headline" .. i] = { bg = Util.blend_bg(color, 0.05) }
  end
  return ret
end

return M
