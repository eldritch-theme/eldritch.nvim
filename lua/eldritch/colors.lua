local util = require("eldritch.util")

local M = {}

---@class Palette
M.default = {
  none = "NONE",
  bg_dark = "#171928",
  bg = "#212337",
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
  git = { change = "#7081d0", add = "#37f499", delete = "#f16c75" },
  gitSigns = {
    add = "#37f499",
    change = "#7081d0",
    delete = "#f16c75",
  },
}

---@class Palette
M.darker = {
  none = "NONE",
  bg = "#171928",
  bg_dark = "#0f101a",
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
}

---@return ColorScheme
function M.setup()
  local config = require("eldritch.config")
  local palette_name = config.options.palette or "default"

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = M[palette_name] or M.default

  util.bg = colors.bg

  colors.diff = {
    add = util.darken(colors.green, 0.15),
    delete = util.darken(colors.red, 0.15),
    change = util.darken(colors.yellow, 0.15),
    text = colors.cyan,
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.comment, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or config.options.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or config.options.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = util.darken(colors.comment, 0.4)
  colors.bg_search = colors.comment
  colors.fg_sidebar = colors.fg_dark
  -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.red
  colors.todo = colors.green
  colors.warning = colors.yellow
  colors.info = colors.comment
  colors.hint = colors.dark_green

  colors.delta = {
    add = util.darken(colors.green, 0.45),
    delete = util.darken(colors.red, 0.45),
  }

  config.options.on_colors(colors)

  return colors
end

return M
