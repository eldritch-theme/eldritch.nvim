local Util = require("eldritch.util")

local M = {}

---@type table<string, Palette|fun(opts:eldritch.Config):Palette>
M.styles = setmetatable({}, {
  __index = function(_, style)
    return vim.deepcopy(Util.mod("eldritch.colors." .. style))
  end,
})

---@param opts? eldritch.Config
function M.setup(opts)
  opts = require("eldritch.config").extend(opts)

  local palette = M.styles[opts.style]
  if type(palette) == "function" then
    palette = palette(opts) --[[@as Palette]]
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = palette

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  colors.diff = {
    add = Util.blend_bg(colors.green, 0.25),
    delete = Util.blend_bg(colors.red, 0.25),
    change = Util.blend_bg(colors.blue, 0.15),
    text = colors.blue,
  }

  colors.git.ignore = colors.dark3
  colors.black = Util.blend_bg(colors.bg, 0.8, "#000000")
  colors.border_highlight = Util.blend_bg(colors.blue, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = Util.blend_bg(colors.visual, 0.4)
  colors.bg_search = colors.comment
  colors.fg_sidebar = colors.fg_dark
  colors.fg_float = colors.fg

  colors.error = colors.red
  colors.todo = colors.bright_green
  colors.warning = colors.yellow
  colors.info = colors.cyan
  colors.hint = colors.dark_green

  colors.rainbow = {
    colors.cyan,
    colors.yellow,
    colors.green,
    colors.bright_cyan,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  -- stylua: ignore
  --- @class TerminalColors
  --- ANSI colors from SPEC.md section 1.1.2
  colors.terminal = {
    black          = colors.ansi_black,
    black_bright   = colors.ansi_bright_black,
    red            = colors.ansi_red,
    red_bright     = colors.ansi_bright_red,
    green          = colors.ansi_green,
    green_bright   = colors.ansi_bright_green,
    yellow         = colors.ansi_yellow,
    yellow_bright  = colors.ansi_bright_yellow,
    blue           = colors.ansi_blue,
    blue_bright    = colors.ansi_bright_blue,
    magenta        = colors.ansi_magenta,
    magenta_bright = colors.ansi_bright_magenta,
    cyan           = colors.ansi_cyan,
    cyan_bright    = colors.ansi_bright_cyan,
    white          = colors.ansi_white,
    white_bright   = colors.ansi_bright_white,
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
