local config = require("eldritch.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? eldritch.Config
function M.load(opts)
  opts = require("eldritch.config").extend(opts)
  local bg = vim.o.background
  local style_bg = opts.style == "minimal" and "light" or "dark"

  if bg ~= style_bg then
    if vim.g.colors_name == "eldritch-" .. opts.style then
      opts.style = bg == "light" and (M.styles.light or "minimal") or (M.styles.dark or "eldritch")
    else
      vim.o.background = style_bg
    end
  end
  M.styles[vim.o.background] = opts.style
  return require("eldritch.theme").setup(opts)
end

M.setup = config.setup

return M
