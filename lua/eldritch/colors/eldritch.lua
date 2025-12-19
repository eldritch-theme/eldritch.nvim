---@type Palette
return {
  none = "NONE",
  bg = "#212337",
  bg_dark = "#171928",
  bg_dark1 = "#0f101a",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#ebfafa",
  fg_dark = "#ABB4DA",
  fg_gutter = "#3b4261",
  fg_gutter_light = "#7081d0",
  dark3 = "#6473B7",
  comment = "#7081d0",
  dark5 = "#5866A2",
  bright_cyan = "#39DDFD",
  visual = "#76639e",
  bg_visual = "#76639e",
  cyan = "#04d1f9",
  dark_cyan = "#10A1BD",
  magenta = "#a48cf2",
  bright_purple = "#ad8cff",
  magenta2 = "#bf4f8e",
  magenta3 = "#722f55",
  pink = "#f265b5",
  purple = "#a48cf2",
  orange = "#f7c67f",
  yellow = "#f1fc79",
  dark_yellow = "#c0c95f",
  green = "#37f499",
  bright_green = "#00FA82",
  dark_green = "#33C57F",
  red = "#f16c75",
  bright_red = "#f0313e",
  git = {
    change = "#7081d0",
    add = "#37f499",
    delete = "#f16c75",
  },
  gitSigns = {
    add = "#37f499",
    change = "#7081d0",
    delete = "#f16c75",
  },
  -- Derived color variants for compatibility
  blue = "#04d1f9", -- same as cyan
  blue0 = "#3b4261", -- same as fg_gutter (darkest blue tone)
  blue1 = "#39DDFD", -- same as bright_cyan
  blue2 = "#10A1BD", -- same as dark_cyan
  blue5 = "#04d1f9", -- same as cyan (for operators/delimiters)
  blue6 = "#39DDFD", -- same as bright_cyan (for regex)
  blue7 = "#3b4261", -- same as fg_gutter (for subtle backgrounds)
  green1 = "#00FA82", -- same as bright_green
  green2 = "#33C57F", -- same as dark_green
  red1 = "#f0313e", -- same as bright_red
  teal = "#00FA82", -- same as bright_green
}
