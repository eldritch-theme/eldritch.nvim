local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  return {
    Sneak = { fg = c.bg_highlight, bg = c.magenta },
    SneakScope = { bg = c.bg_visual },
  }
end

return M
