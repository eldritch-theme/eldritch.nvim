local M = {}

M.url = "https://github.com/echasnovski/mini.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    MiniDiffSignAdd    = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    MiniDiffSignChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    MiniDiffSignDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
  }
end

return M
