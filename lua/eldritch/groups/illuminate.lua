local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    illuminatedWord       = { bg = c.fg_gutter },
    illuminatedCurWord    = { bg = c.fg_gutter },
    IlluminatedWordText   = { bg = c.fg_gutter },
    IlluminatedWordRead   = { bg = c.fg_gutter },
    IlluminatedWordWrite  = { bg = c.fg_gutter },
  }
end

return M
