local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NeotestPassed       = { fg = c.green },
    NeotestRunning      = { fg = c.yellow },
    NeotestFailed       = { fg = c.red },
    NeotestSkipped      = { fg = c.cyan },
    NeotestTest         = { fg = c.fg_sidebar },
    NeotestNamespace    = { fg = c.purple },
    NeotestFocused      = { fg = c.yellow },
    NeotestFile         = { fg = c.cyan },
    NeotestDir          = { fg = c.cyan },
    NeotestBorder       = { fg = c.cyan },
    NeotestIndent       = { fg = c.fg_sidebar },
    NeotestExpandMarker = { fg = c.fg_sidebar },
    NeotestAdapterName  = { fg = c.green, bold = true },
    NeotestWinSelect    = { fg = c.cyan },
    NeotestMarked       = { fg = c.cyan },
    NeotestTarget       = { fg = c.cyan },
  }
end

return M
