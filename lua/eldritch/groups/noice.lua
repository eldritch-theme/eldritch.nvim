local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
    -- Default
    NoiceCmdline               = { fg = c.green, bg = c.bg_float },
    NoiceCmdlineIcon           = { fg = c.green, bg = c.bg_float },
    NoiceCmdlinePopupBorder    = { fg = c.green, bg = c.bg_float },
    NoiceCmdlinePopupTitle     = { fg = c.green, bg = c.bg_float },
    -- Filter (shell command)
    NoiceCmdlinePopupBorderFilter = { fg = c.pink, bg = c.bg_float },
    NoiceCmdlineIconFilter     = { fg = c.pink, bg = c.bg_float },
    -- Lua
    NoiceCmdlinePopupBorderLua = { fg = c.dark_cyan },
    NoiceCmdlineIconLua        = { fg = c.dark_cyan },
    -- Help
    NoiceCmdlinePopupBorderHelp = { fg = c.yellow },
    NoiceCmdlineIconHelp       = { fg = c.yellow },
    -- LspProgress
    NoiceLspProgressSpinner    = { fg = c.cyan },
    NoiceLspProgressTitle      = { fg = c.green },
    NoiceLspProgressClient     = { fg = c.purple },
    NoiceMini                  = { bg = c.bg_highlight },
  }
end

return M
