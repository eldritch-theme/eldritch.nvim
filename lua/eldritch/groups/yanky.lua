local M = {}

M.url = "https://github.com/gbprod/yanky.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    YankyPut   = "IncSearch",
    YankyYanked = "IncSearch",
  }
end

return M
