local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder         = { fg = c.green, bg = c.bg_float },
    TelescopeNormal         = { fg = c.fg, bg = c.bg_float },
    TelescopePromptBorder   = { fg = c.cyan, bg = c.bg_float },
    TelescopePromptTitle    = { fg = c.cyan, bg = c.bg_float },
    TelescopeResultsBorder  = { fg = c.green, bg = c.bg_float },
    TelescopePreviewBorder  = { fg = c.green, bg = c.bg_float },
    TelescopeSelection      = { fg = c.fg, bg = c.dark5 },
    TelescopeMultiSelection = { fg = c.green, bg = c.dark5 },
    TelescopeMatching       = { fg = c.pink },
    TelescopePromptPrefix   = { fg = c.green },
    TelescopeResultsDiffDelete = { fg = c.red },
    TelescopeResultsDiffChange = { fg = c.cyan },
    TelescopeResultsDiffAdd = { fg = c.pink },
    TelescopeResultsComment = { fg = c.dark3 },
  }
end

return M
