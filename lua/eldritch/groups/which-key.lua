local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.dark_cyan },
    WhichKeyGroup     = { fg = c.cyan },
    WhichKeyDesc      = { fg = c.green },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat     = { bg = c.bg_float },
    WhichKeyValue     = { fg = c.dark5 },
    WhichKeyBorder    = { fg = c.cyan },
  }
end

return M
