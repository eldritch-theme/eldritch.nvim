local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type eldritch.HighlightsFn
function M.get(c)
  return {
    IlluminatedWordRead = { bg = c.fg_gutter },
    IlluminatedWordText = { bg = c.fg_gutter },
    IlluminatedWordWrite = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },
    illuminatedWord = { bg = c.fg_gutter },
  }
end

return M
