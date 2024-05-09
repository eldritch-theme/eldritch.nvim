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

---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("eldritch.config")

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = M.default

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
