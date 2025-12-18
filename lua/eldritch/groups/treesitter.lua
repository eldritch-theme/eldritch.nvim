local Util = require("eldritch.util")

local M = {}

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- Treesitter syntax highlighting based on SPEC.md section 3
  -- stylua: ignore
  local ret = {
    -- Error and punctuation (SPEC.md)
    ["@error"]                      = { fg = c.bright_red },
    ["@punctuation.delimiter"]      = { fg = c.fg },
    ["@punctuation.bracket"]        = { fg = c.fg },
    ["@punctuation.special"]        = { fg = c.cyan },
    ["@punctuation.special.markdown"] = { fg = c.orange },
    
    -- Markup list (SPEC.md)
    ["@markup.list"]                = { fg = c.cyan },
    
    -- Constants (SPEC.md)
    ["@constant"]                   = { fg = c.bright_cyan },
    ["@constant.builtin"]           = { fg = c.bright_cyan },
    ["@constant.macro"]             = { fg = c.cyan },
    ["@markup.link.label.symbol"]   = { fg = c.bright_cyan },
    
    -- Strings (SPEC.md)
    ["@string"]                     = { fg = c.yellow },
    ["@string.regexp"]              = { fg = c.yellow },
    ["@string.escape"]              = { fg = c.cyan },
    ["@string.special.symbol"]      = { fg = c.green },
    ["@string.documentation"]       = { fg = c.yellow },
    
    -- Characters and numbers (SPEC.md)
    ["@character"]                  = { fg = c.pink },
    ["@character.printf"]           = "SpecialChar",
    ["@character.special"]          = "SpecialChar",
    ["@number"]                     = { fg = c.green },
    ["@number.float"]               = { fg = c.pink },
    ["@boolean"]                    = { fg = c.green },
    
    -- Annotations and attributes (SPEC.md)
    ["@annotation"]                 = { fg = c.yellow },
    ["@attribute"]                  = { fg = c.cyan },
    
    -- Modules (SPEC.md)
    ["@module"]                     = { fg = c.orange },
    ["@module.builtin"]             = { fg = c.red },
    ["@namespace.builtin"]          = "@variable.builtin",
    
    -- Functions (SPEC.md)
    ["@function"]                   = { fg = c.purple, style = opts.styles.functions },
    ["@function.builtin"]           = { fg = c.cyan },
    ["@function.call"]              = "@function",
    ["@function.macro"]             = { fg = c.purple },
    ["@function.method"]            = { fg = c.purple },
    ["@function.method.call"]       = "@function.method",
    
    -- Variables and parameters (SPEC.md)
    ["@variable"]                   = { fg = c.red, style = opts.styles.variables },
    ["@variable.builtin"]           = { fg = c.green },
    ["@variable.parameter"]         = { fg = c.orange },
    ["@variable.parameter.reference"] = { fg = c.orange },
    ["@variable.parameter.builtin"] = { fg = c.orange }, -- builtin parameters use orange like regular parameters
    ["@variable.member"]            = { fg = c.orange },
    ["@property"]                   = { fg = c.bright_green },
    
    -- Constructor (SPEC.md)
    ["@constructor"]                = { fg = c.cyan },
    ["@constructor.tsx"]            = { fg = c.cyan },
    
    -- Keywords (SPEC.md)
    ["@keyword"]                    = { fg = c.green, style = opts.styles.keywords },
    ["@keyword.conditional"]        = { fg = c.purple },
    ["@keyword.repeat"]             = { fg = c.purple },
    ["@keyword.function"]           = { fg = c.cyan },
    ["@keyword.function.ruby"]      = { fg = c.purple },
    ["@keyword.operator"]           = { fg = c.purple },
    ["@keyword.exception"]          = { fg = c.green },
    ["@keyword.include"]            = { fg = c.purple },
    ["@keyword.import"]             = "Include",
    ["@keyword.return"]             = "@keyword",
    ["@keyword.storage"]            = "StorageClass",
    ["@keyword.coroutine"]          = "@keyword",
    ["@keyword.debug"]              = "Debug",
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    
    -- Labels (SPEC.md)
    ["@label"]                      = { fg = c.cyan },
    
    -- Operators (SPEC.md)
    ["@operator"]                   = { fg = c.purple },
    
    -- Types (SPEC.md)
    ["@type"]                       = { fg = c.bright_purple },
    ["@type.builtin"]               = { fg = c.cyan, italic = true },
    ["@type.qualifier"]             = { fg = c.purple },
    ["@type.def"]                   = { fg = c.yellow },
    ["@type.definition"]            = "Typedef",
    
    -- Structure (SPEC.md)
    ["@structure"]                  = { fg = c.green },
    
    -- Comments
    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { fg = c.error },
    ["@comment.hint"]               = { fg = c.hint },
    ["@comment.info"]               = { fg = c.info },
    ["@comment.note"]               = { fg = c.hint },
    ["@comment.todo"]               = { fg = c.todo },
    ["@comment.warning"]            = { fg = c.warning },
    
    -- Markup (SPEC.md)
    ["@markup"]                     = { fg = c.orange },
    ["@markup.strong"]              = { fg = c.orange, bold = true },
    ["@markup.emphasis"]            = { fg = c.yellow, italic = true },
    ["@markup.underline"]           = { fg = c.orange },
    ["@markup.heading"]             = { fg = c.purple, bold = true },
    ["@markup.raw"]                 = { fg = c.yellow },
    ["@markup.link.url"]            = { fg = c.yellow, italic = true },
    ["@markup.link"]                = { fg = c.orange, bold = true },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.italic"]              = { italic = true },
    ["@markup.list.checked"]        = { fg = c.purple },
    ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
    ["@markup.list.unchecked"]      = { fg = c.cyan },
    ["@markup.math"]                = "Special",
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.cyan },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    
    -- Tags (SPEC.md)
    ["@tag"]                        = { fg = c.cyan },
    ["@tag.attribute"]              = { fg = c.pink },
    ["@tag.delimiter"]              = { fg = c.cyan },
    ["@tag.delimiter.tsx"]          = { fg = Util.blend_bg(c.cyan, 0.7) },
    ["@tag.tsx"]                    = { fg = c.red },
    ["@tag.javascript"]             = { fg = c.red },
    
    -- Diff
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    
    -- Misc
    ["@none"]                       = {},
  }

  for i, color in ipairs(c.rainbow) do
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true, bg = Util.blend_bg(color, 0.1) }
  end
  return ret
end

return M
