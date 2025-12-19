local Util = require("eldritch.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  local ret = {
    RenderMarkdownBullet = { fg = c.orange }, -- horizontal rule
    RenderMarkdownCode = { bg = c.bg_dark },
    RenderMarkdownDash = { fg = c.orange }, -- horizontal rule
    RenderMarkdownTableHead = { fg = c.red },
    RenderMarkdownTableRow = { fg = c.orange },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
  }
  for i, color in ipairs(c.rainbow) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end
  return ret
end

return M
