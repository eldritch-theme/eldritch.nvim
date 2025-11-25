local M = {}

M.url = "https://github.com/nvimdev/dashboard-nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    DashboardShortCut = { fg = c.dark_cyan },
    DashboardHeader   = { fg = c.green },
    DashboardCenter   = { fg = c.magenta },
    DashboardFooter   = { fg = c.dark_cyan },
    DashboardKey      = { fg = c.purple },
    DashboardDesc     = { fg = c.cyan },
    DashboardIcon     = { fg = c.green, bold = true },
  }
end

return M
