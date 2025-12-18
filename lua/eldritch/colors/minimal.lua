---@type Palette
return {
  none = "NONE",
  bg = "#212337",
  bg_dark = "#171928",
  bg_dark1 = "#0f101a",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  cyan = "#04d1f9",
  green = "#37f499",
  magenta = "#a48cf2",
  dark3 = "#6473B7",
  comment = "#7081d0",
  dark5 = "#5866A2",
  fg = "#ebfafa",
  fg_dark = "#ABB4DA",
  fg_gutter = "#3b4261",
  fg_gutter_light = "#7081d0",
  bright_cyan = "#fafafa",
  visual = "#76639e",
  bg_visual = "#76639e",
  dark_cyan = "#e0e0e0",
  magenta2 = "#bf4f8e",
  magenta3 = "#722f55",
  pink = "#e0e0e0",
  purple = "#e0e0e0",
  bright_purple = "#e0e0e0",
  orange = "#e0e0e0",
  yellow = "#e0e0e0",
  dark_yellow = "#e0e0e0",
  bright_green = "#fafafa",
  dark_green = "#e0e0e0",
  red = "#f16c75",
  bright_red = "#fafafa",
  git = {
    change = "#e0e0e0",
    add = "#37f499",
    delete = "#f16c75",
  },
  gitSigns = {
    add = "#37f499",
    change = "#e0e0e0",
    delete = "#f16c75",
  },
  -- Derived color variants for compatibility
  blue = "#04d1f9",       -- same as cyan
  blue0 = "#3b4261",      -- same as fg_gutter (darkest blue tone)
  blue1 = "#fafafa",      -- minimal uses white/gray for bright colors
  blue2 = "#e0e0e0",      -- minimal uses gray
  blue5 = "#04d1f9",      -- same as cyan (for operators/delimiters)
  blue6 = "#fafafa",      -- minimal uses white
  blue7 = "#3b4261",      -- same as fg_gutter (for subtle backgrounds)
  green1 = "#fafafa",     -- minimal uses white
  green2 = "#e0e0e0",     -- minimal uses gray
  red1 = "#fafafa",       -- minimal uses white
  teal = "#fafafa",       -- minimal uses white
}
