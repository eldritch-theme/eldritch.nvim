local M = {}

---@class Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: Highlights, colors: ColorScheme)
local defaults = {
  transparent = false, -- Enable this to disable setting the background color
  palette = "default", -- DEPRECATED: Use `vim.cmd.colorscheme eldritch-dark` instead to switch to the darker palette.
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    -- transparent will set the background color to `None`
    --  dark will set background color to #171928
    --  normal or anything other than dark or transparent will set background color to #212337
    sidebars = "normal", -- style for sidebars, see below
    floats = "normal", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background
}

---@type Config
M.options = {}
-- NOTE: This is temprorary for retrocompatibility with palette option
M.initial_options = {} -- To store options from eldritch.setup()

---@param options Config|nil
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  M.initial_options = M.options
end

---@param options Config|nil
function M.extend(options)
  local base_options = M.options
  if type(base_options) ~= "table" then
    base_options = defaults
  end
  -- Ensure 'options' is a table before passing to vim.tbl_deep_extend
  local opts_to_merge = {}
  if type(options) == "table" then
    opts_to_merge = options
  end
  M.options = vim.tbl_deep_extend("force", {}, base_options, opts_to_merge)
end

return M
