local M = {}

M.url = "https://github.com/nvim-tree/nvim-tree.lua"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NvimTreeNormal       = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NvimTreeWinSeparator = {
      fg = opts.styles.sidebars == "transparent" and c.border or c.bg_sidebar,
      bg = c.bg_sidebar,
    },
    NvimTreeNormalNC     = { fg = c.fg_sidebar, bg = opts.transparent and c.none or c.bg_sidebar },
    NvimTreeRootFolder   = { fg = c.cyan, bold = true },
    NvimTreeGitDirty     = { fg = c.git.change },
    NvimTreeGitNew       = { fg = c.git.add },
    NvimTreeGitDeleted   = { fg = c.git.delete },
    NvimTreeOpenedFile   = { bg = c.bg_highlight },
    NvimTreeSpecialFile  = { fg = c.green, underline = true },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile    = { fg = c.fg_sidebar },
    NvimTreeSymlink      = { fg = c.cyan },
    NvimTreeFolderIcon   = { bg = c.none, fg = c.cyan },
  }
end

return M
