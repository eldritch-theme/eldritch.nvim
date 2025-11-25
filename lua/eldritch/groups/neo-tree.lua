local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NeoTreeNormal       = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NeoTreeNormalNC     = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NeoTreeDimText      = { fg = c.fg_gutter },
    NeoTreeTitleBar     = "NeoTreeNormalNC",
    NeoTreeFloatBorder  = "NeoTreeNormalNC",
  }
end

return M
