local M = {}

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- Language-specific highlights from SPEC.md
  -- stylua: ignore
  return {
    -- HTML highlights from SPEC.md
    htmlArg            = { fg = c.pink },
    htmlBold           = { fg = c.yellow, bold = true },
    htmlEndTag         = { fg = c.cyan },
    htmlH1             = { fg = c.purple },
    htmlH2             = { fg = c.purple },
    htmlH3             = { fg = c.purple },
    htmlH4             = { fg = c.purple },
    htmlH5             = { fg = c.purple },
    htmlH6             = { fg = c.purple },
    htmlItalic         = { fg = c.green, italic = true },
    htmlLink           = { fg = c.green, underline = true },
    htmlSpecialChar    = { fg = c.yellow },
    htmlSpecialTagName = { fg = c.cyan },
    htmlTag            = { fg = c.cyan },
    htmlTagN           = { fg = c.cyan },
    htmlTagName        = { fg = c.cyan },
    htmlTitle          = { fg = c.fg },
    
    -- Markdown highlights from SPEC.md
    markdownBlockquote         = { fg = c.yellow, italic = true },
    markdownBold               = { fg = c.orange, bold = true },
    markdownCode               = { fg = c.pink },
    markdownCodeBlock          = { fg = c.orange },
    markdownCodeDelimiter      = { fg = c.red },
    markdownH1                 = { fg = c.purple, bold = true },
    markdownH2                 = { fg = c.purple, bold = true },
    markdownH3                 = { fg = c.purple, bold = true },
    markdownH4                 = { fg = c.purple, bold = true },
    markdownH5                 = { fg = c.purple, bold = true },
    markdownH6                 = { fg = c.purple, bold = true },
    markdownHeadingDelimiter   = { fg = c.red },
    markdownHeadingRule        = { fg = c.comment },
    markdownId                 = { fg = c.green },
    markdownIdDeclaration      = { fg = c.cyan },
    markdownIdDelimiter        = { fg = c.green },
    markdownItalic             = { fg = c.yellow, italic = true },
    markdownLinkDelimiter      = { fg = c.green },
    markdownLinkText           = { fg = c.purple },
    markdownListMarker         = { fg = c.cyan },
    markdownOrderedListMarker  = { fg = c.red },
    markdownRule               = { fg = c.comment },
    
    -- Diff highlights from SPEC.md
    diffAdded   = { fg = c.pink },
    diffRemoved = { fg = c.red },
    diffFileId  = { fg = c.yellow, bold = true, reverse = true },
    diffFile    = { fg = c.dark3 }, -- uses dark3 color for non-essential diff file info
    diffNewFile = { fg = c.pink },
    diffOldFile = { fg = c.red },
  }
end

return M
