---@class eldritch.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias eldritch.Highlights table<string,eldritch.Highlight|string>

---@alias eldritch.HighlightsFn fun(colors: ColorScheme, opts:eldritch.Config):eldritch.Highlights

---@class eldritch.Cache
---@field groups eldritch.Highlights
---@field inputs table
