local util = require("eldritch.util")
local theme = require("eldritch.theme")
local config = require("eldritch.config")

local M = {}

---@param opts Config|nil
function M.load(opts)
  if opts then
    require("eldritch.config").extend(opts)
  end
  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
