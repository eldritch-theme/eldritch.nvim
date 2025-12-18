local Util = require("eldritch.util")

local M = {}

---@type eldritch.HighlightsFn
function M.get(c)
  -- Semantic tokens based on SPEC.md
  -- stylua: ignore
  return {
    -- Semantic tokens (non-LSP) from SPEC.md
    ["@class"]                                 = { fg = c.cyan },
    ["@struct"]                                = { fg = c.cyan },
    ["@enum"]                                  = { fg = c.cyan },
    ["@enumMember"]                            = { fg = c.green },
    ["@event"]                                 = { fg = c.cyan },
    ["@interface"]                             = { fg = c.cyan },
    ["@modifier"]                              = { fg = c.cyan },
    ["@regexp"]                                = { fg = c.yellow },
    ["@typeParameter"]                         = { fg = c.cyan },
    ["@decorator"]                             = { fg = c.cyan },
    
    -- LSP Semantic tokens from SPEC.md - all use link syntax
    ["@lsp.type.boolean"]                      = { link = "@boolean" },
    ["@lsp.type.builtinType"]                  = { link = "@type.builtin" },
    ["@lsp.type.comment"]                      = { link = "@comment" },
    ["@lsp.type.decorator"]                    = { link = "@attribute" },
    ["@lsp.type.deriveHelper"]                 = { link = "@attribute" },
    ["@lsp.type.enum"]                         = { link = "@type" },
    ["@lsp.type.enumMember"]                   = { link = "@constant" },
    ["@lsp.type.escapeSequence"]               = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"]              = { link = "@markup.list" },
    ["@lsp.type.generic"]                      = { link = "@variable" },
    ["@lsp.type.keyword"]                      = { link = "@keyword" },
    ["@lsp.type.namespace"]                    = { link = "@module" },
    ["@lsp.type.number"]                       = { link = "@number" },
    ["@lsp.type.operator"]                     = { link = "@operator" },
    ["@lsp.type.parameter"]                    = { link = "@variable.parameter" },
    ["@lsp.type.property"]                     = { link = "@property" },
    ["@lsp.type.selfKeyword"]                  = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"]              = { link = "@variable.builtin" },
    ["@lsp.type.string"]                       = { link = "@string" },
    ["@lsp.type.typeAlias"]                    = { link = "@type.def" },
    ["@lsp.type.variable"]                     = {}, -- use treesitter @variable styles instead of overriding per SPEC.md
    
    -- LSP type modifiers from SPEC.md
    ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
    ["@lsp.typemod.string.injected"]           = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"]     = { link = "@type.builtin" },
    ["@lsp.typemod.variable.callable"]         = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
    ["@lsp.typemod.variable.static"]           = { link = "@constant" },
    
    -- Language-specific LSP tokens from SPEC.md
    ["@lsp.type.namespace.python"]             = { link = "@variable" },
    
    -- Additional LSP types for completeness (already in current impl)
    ["@lsp.type.class"]                        = "@type",
    ["@lsp.type.const"]                        = "@constant",
    ["@lsp.type.function"]                     = "@function",
    ["@lsp.type.interface"]                    = { fg = Util.blend_fg(c.cyan, 0.7) },
    ["@lsp.type.lifetime"]                     = "@keyword.storage",
    ["@lsp.type.macro"]                        = "@function.macro",
    ["@lsp.type.method"]                       = "@function.method",
    ["@lsp.type.module"]                       = "@module",
    ["@lsp.type.struct"]                       = "@type",
    ["@lsp.type.typeParameter"]                = "@type",
    ["@lsp.type.unresolvedReference"]          = { undercurl = true, sp = c.error },
    ["@lsp.typemod.keyword.async"]             = "@keyword.coroutine",
    ["@lsp.typemod.type.defaultLibrary"]       = { fg = Util.blend_bg(c.cyan, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = Util.blend_bg(c.cyan, 0.8) },
  }
end

return M
