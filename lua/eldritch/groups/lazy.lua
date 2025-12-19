local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  return {
    LazyProgressDone = { bold = true, fg = c.magenta2 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },
    LazyH2 = { bold = true, fg = c.pink },
  }
end

return M
