local M = {}

---@param opts? eldritch.Config
function M.setup(opts)
  opts = require("eldritch.config").extend(opts)

  local colors = require("eldritch.colors").setup(opts)
  local groups = require("eldritch.groups").setup(colors, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "eldritch-" .. opts.style

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  if opts.terminal_colors then
    M.terminal(colors)
  end

  return colors, groups, opts
end

---@param colors ColorScheme
function M.terminal(colors)
  require("eldritch.util").terminal(colors)
end

return M
