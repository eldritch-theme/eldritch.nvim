local M = {}

M.url = "https://github.com/dense-analysis/ale"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  return {
    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },
  }
end

return M
