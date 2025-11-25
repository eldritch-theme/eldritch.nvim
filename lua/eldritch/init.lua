local config = require("eldritch.config")

local M = {}

---@type {[string]: string}
M.styles = {}

---@param opts? eldritch.Config
function M.load(opts)
  opts = require("eldritch.config").extend(opts)
  
  -- Handle style passed as string (for backward compatibility)
  if type(opts) == "string" then
    opts = { style = opts }
  end
  
  M.styles[vim.o.background] = opts.style
  return require("eldritch.theme").setup(opts)
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
