local eldritch = require("eldritch")
local configs = eldritch.configs()
local colors = eldritch.colors()

local bg = configs.transparent_bg and colors.none or configs.lualine_bg_color or colors.selection

-- Green
local normal = {
   a = { fg = colors.black, bg = colors.green, gui = "bold" },
   b = { fg = colors.green, bg = bg },
   c = { fg = colors.fg, bg = bg },
}

-- Purple
local command = {
   a = { fg = colors.black, bg = colors.purple, gui = "bold" },
   b = { fg = colors.purple, bg = bg },
}

-- Red
local visual = {
   b = { fg = colors.red, bg = bg },
   a = { fg = colors.black, bg = colors.red, gui = "bold" },
}

-- Visual
local inactive = {
   a = { fg = colors.white, bg = colors.visual, gui = "bold" },
   b = { fg = colors.black, bg = colors.white },
}

-- Yellow
local replace = {
   a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
   b = { fg = colors.yellow, bg = bg },
   c = { fg = colors.white, bg = bg },
}

-- Cyan
local insert = {
   a = { fg = colors.black, bg = colors.cyan, gui = "bold" },
   b = { fg = colors.cyan, bg = bg },
   c = { fg = colors.white, bg = bg },
}

return {
   normal = normal,
   command = command,
   visual = visual,
   inactive = inactive,
   replace = replace,
   insert = insert,
}
