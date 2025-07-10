local util = require("eldritch.util")
local theme = require("eldritch.theme")
local config = require("eldritch.config")

local M = {}

---@param arg string|table|nil
function M.load(arg)
  local opts_to_pass = {}
  local current_colorscheme_name = vim.g.colors_name

  if type(arg) == "table" then
    -- If arg is a table, it's the full config options
    opts_to_pass = arg
  elseif type(arg) == "string" then
    -- If arg is a string, it's a palette name
    opts_to_pass.palette = arg
  else
    -- If arg is nil (i.e., eldritch colorscheme is loaded), use the palette from initial_options
    opts_to_pass.palette = config.initial_options.palette or "default"
  end
  -- If arg is nil, opts_to_pass remains empty, and config.extend will use defaults.

  -- Always extend the configuration with a table
  config.extend(opts_to_pass)

  util.load(theme.setup())

  vim.g.colors_name = current_colorscheme_name
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
