local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  return {
    IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true },
    IndentBlanklineContextChar = { fg = c.blue1, nocombine = true },
    IblIndent = { fg = c.fg_gutter, nocombine = true },
    IblScope = { fg = c.blue1, nocombine = true },
  }
end

return M
