local colors = require("eldritch.colors").setup()
local config = require("eldritch.config").options

local eldritch = {}

eldritch.normal = {
  a = { bg = colors.cyan, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.cyan },
  c = { bg = colors.bg_highlight, fg = colors.fg_sidebar },
}

eldritch.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

eldritch.command = {
  a = { bg = colors.pink, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.pink },
}

eldritch.visual = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
}

eldritch.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

eldritch.terminal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
}

eldritch.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.dark_cyan },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(eldritch) do
    mode.a.gui = "bold"
  end
end

return eldritch
