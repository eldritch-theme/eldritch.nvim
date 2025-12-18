-- Color palette based on SPEC.md from https://github.com/eldritch-theme/eldritch
---@type Palette
return {
  none = "NONE",
  
  -- Standard colors from SPEC.md section 1.1.1
  bg = "#212337",
  current_line = "#323449",
  fg = "#ebfafa",
  comment = "#7081d0",
  cyan = "#04d1f9",
  green = "#37f499",
  orange = "#f7c67f",
  pink = "#f265b5",
  purple = "#a48cf2",
  red = "#f16c75",
  yellow = "#f1fc79",
  
  -- Supplementary colors from SPEC.md section 2
  bg_dark = "#171928",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg_dark = "#ABB4DA",
  fg_gutter = "#3b4261",
  dark3 = "#6473B7",
  dark5 = "#5866A2",
  visual = "#76639e",
  bg_visual = "#76639e",
  dark_cyan = "#10A1BD",
  magenta2 = "#bf4f8e",
  magenta3 = "#722f55",
  dark_yellow = "#c0c95f",
  dark_green = "#33C57F",
  bright_red = "#f0313e",
  bright_cyan = "#04d1f9",  -- same as cyan per SPEC.md
  bright_green = "#37f499", -- same as green per SPEC.md
  bright_purple = "#a48cf2", -- same as purple per SPEC.md
  
  -- ANSI colors from SPEC.md section 1.1.2
  ansi_black = "#21222C",
  ansi_red = "#f16c75",
  ansi_green = "#37f499",
  ansi_yellow = "#f1fc79",
  ansi_blue = "#a48cf2",
  ansi_magenta = "#f265b5",
  ansi_cyan = "#04d1f9",
  ansi_white = "#ebfafa",
  ansi_bright_black = "#323449",
  ansi_bright_red = "#f9515d",
  ansi_bright_green = "#69F8B3",
  ansi_bright_yellow = "#e9f941",
  ansi_bright_blue = "#9071f4",
  ansi_bright_magenta = "#FD92CE",
  ansi_bright_cyan = "#66e4fd",
  ansi_bright_white = "#FFFFFF",
  
  -- Additional derived variants for backward compatibility
  bg_dark1 = "#0f101a",
  fg_gutter_light = "#7081d0",
  magenta = "#a48cf2",
  
  -- Git colors
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
  
  -- Derived color variants for compatibility with existing code
  blue = "#04d1f9",       -- same as cyan
  blue0 = "#3b4261",      -- same as fg_gutter (darkest blue tone)
  blue1 = "#39DDFD",      -- bright cyan variant
  blue2 = "#10A1BD",      -- same as dark_cyan
  blue5 = "#04d1f9",      -- same as cyan (for operators/delimiters)
  blue6 = "#39DDFD",      -- bright cyan for regex
  blue7 = "#3b4261",      -- same as fg_gutter (for subtle backgrounds)
  green1 = "#00FA82",     -- bright green variant
  green2 = "#33C57F",     -- same as dark_green
  red1 = "#f0313e",       -- same as bright_red
  teal = "#00FA82",       -- bright green variant
}
