local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    RainbowDelimiterRed    = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen  = { fg = c.purple },
    RainbowDelimiterBlue   = { fg = c.cyan },
    RainbowDelimiterViolet = { fg = c.green },
    RainbowDelimiterCyan   = { fg = c.dark_cyan },
    -- ts-rainbow
    rainbowcol1            = { fg = c.red },
    rainbowcol2            = { fg = c.yellow },
    rainbowcol3            = { fg = c.purple },
    rainbowcol4            = { fg = c.cyan },
    rainbowcol5            = { fg = c.cyan },
    rainbowcol6            = { fg = c.magenta },
    rainbowcol7            = { fg = c.green },
    -- ts-rainbow2
    TSRainbowRed           = { fg = c.red },
    TSRainbowOrange        = { fg = c.orange },
    TSRainbowYellow        = { fg = c.yellow },
    TSRainbowGreen         = { fg = c.purple },
    TSRainbowBlue          = { fg = c.cyan },
    TSRainbowViolet        = { fg = c.green },
    TSRainbowCyan          = { fg = c.dark_cyan },
  }
end

return M
