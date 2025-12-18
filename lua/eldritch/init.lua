local config = require("eldritch.config")

local M = {}
---@type {dark?: string}
M.styles = {}

---@param opts? eldritch.Config
function M.load(opts)
  opts = require("eldritch.config").extend(opts)
  local bg = vim.o.background
  
  -- All eldritch styles are dark
  if bg ~= "dark" then
    vim.o.background = "dark"
  end
  
  M.styles.dark = opts.style
  return require("eldritch.theme").setup(opts)
end

M.setup = config.setup

return M
