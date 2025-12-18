---@type Palette
return {
  none = "NONE",
  bg = "#171928",
  bg_dark = "#0f101a",
  bg_dark1 = "#060712",
  bg_highlight = "#1e2033",
  fg = "#d8e6e6",
  fg_dark = "#8e94b8",
  fg_gutter = "#2d3249",
  fg_gutter_light = "#4a5584",
  terminal_black = "#2a2e45",
  dark3 = "#445084",
  comment = "#506299",
  dark5 = "#3d4775",
  visual = "#554971",
  bg_visual = "#554971",
  bright_cyan = "#2bafcc",
  cyan = "#0396b3",
  dark_cyan = "#0c7a94",
  magenta = "#8b75d9",
  bright_purple = "#8b75d9",  -- same as magenta in darker variant
  magenta2 = "#94407a",
  magenta3 = "#5c2644",
  pink = "#d154a1",
  purple = "#8b75d9",
  orange = "#d4a666",
  yellow = "#ccd663",
  dark_yellow = "#a1a34d",
  green = "#2dcc82",
  bright_green = "#00cc68",
  dark_green = "#299e64",
  red = "#cc5860",
  bright_red = "#cc2935",
  git = {
    change = "#506299",
    add = "#2dcc82",
    delete = "#cc5860",
  },
  gitSigns = {
    add = "#2dcc82",
    change = "#506299",
    delete = "#cc5860",
  },
  -- Derived color variants for compatibility
  blue = "#0396b3",       -- same as cyan
  blue0 = "#2d3249",      -- same as fg_gutter (darkest blue tone)
  blue1 = "#2bafcc",      -- same as bright_cyan
  blue2 = "#0c7a94",      -- same as dark_cyan
  blue5 = "#0396b3",      -- same as cyan (for operators/delimiters)
  blue6 = "#2bafcc",      -- same as bright_cyan (for regex)
  blue7 = "#2d3249",      -- same as fg_gutter (for subtle backgrounds)
  green1 = "#00cc68",     -- same as bright_green
  green2 = "#299e64",     -- same as dark_green
  red1 = "#cc2935",       -- same as bright_red
  teal = "#00cc68",       -- same as bright_green
}
