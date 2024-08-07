local util = require("eldritch.util")
local colors = require("eldritch.colors")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight
---@field link string|nil

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
  local config = require("eldritch.config")
  local options = config.options
  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }
  local is_transparent = theme.config.transparent
  local bg_float_configured = is_transparent and theme.colors.none or theme.colors.bg_float

  local c = theme.colors

  theme.highlights = {
    Foo = { bg = c.magenta2, fg = c.fg },

    Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
    ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.dark5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.cyan }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { fg = c.fg, bg = c.magenta3 },
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.red }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator = { fg = c.border, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.cyan, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn = { bg = options.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.green }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.cyan }, -- |more-prompt|
    NonText = { fg = c.dark3 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.bg_dark or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg_float, bg = bg_float_configured }, -- Normal text in floating windows.
    FloatBorder = { fg = c.green, bg = bg_float_configured },
    FloatTitle = { fg = c.cyan, bg = bg_float_configured },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.cyan }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.dark3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.orange, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.yellow, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.pink, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.cyan }, -- tab pages line, active tab page label
    Title = { fg = c.cyan, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.magenta3 }, -- Visual mode selection
    VisualNOS = { bg = c.magenta3 }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.orange }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    WinBar = { link = "StatusLine" }, -- window bar
    WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.red }, -- (preferred) any constant
    String = { fg = c.yellow }, --   a string constant: "this is a string"
    Character = { fg = c.orange }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.magenta, style = options.styles.variables }, -- (preferred) any variable name
    Function = { fg = c.pink, style = options.styles.functions }, -- function name (also: methods for classes)

    Statement = { fg = c.magenta }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.cyan }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.dark_cyan, style = options.styles.keywords }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.dark_cyan }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.cyan }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.cyan }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    Delimiter = { link = "Special" }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    Debug = { fg = c.orange }, --    debugging statements

    Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
    Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Italic = { italic = true, fg = c.fg }, -- (preferred) any italic text

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.dark5 },
    qfFileName = { fg = c.cyan },

    htmlH1 = { fg = c.magenta, bold = true },
    htmlH2 = { fg = c.cyan, bold = true },

    -- mkdHeading = { fg = c.orange, bold = true },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.cyan, bold = true },
    mkdCodeEnd = { fg = c.cyan, bold = true },
    -- mkdLink = { fg = c.cyan, underline = true },

    markdownHeadingDelimiter = { fg = c.orange, bold = true },
    markdownCode = { fg = c.cyan },
    markdownCodeBlock = { fg = c.cyan },
    markdownH1 = { fg = c.magenta, bold = true },
    markdownH2 = { fg = c.cyan, bold = true },
    markdownLinkText = { fg = c.cyan, underline = true },

    ["helpCommand"] = { bg = c.terminal_black, fg = c.cyan },

    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.yellow, 0.1), fg = c.yellow }, -- used for breakpoint colors in terminal-debug

    dosIniLabel = { link = "@property" },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.orange }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.dark_green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.dark_green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = util.darken(c.red, 0.1), fg = c.red }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.darken(c.orange, 0.1), fg = c.orange }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.darken(c.yellow, 0.1), fg = c.yellow }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.darken(c.dark_green, 0.1), fg = c.dark_green }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.orange }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.yellow }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.pink }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = util.darken(c.bg_visual, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = util.darken(c.cyan, 0.1), fg = c.dark3 },

    LspInfoBorder = { fg = c.border_highlight, bg = bg_float_configured },

    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.orange },

    DapStoppedLine = { bg = util.darken(c.orange, 0.1) }, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Macro" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@namespace.builtin"] = { link = "@variable.builtin" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"] = { link = "Label" },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@comment.note"] = { fg = c.pink },
    ["@comment.error"] = { fg = c.red },
    ["@comment.hint"] = { fg = c.pink },
    ["@comment.info"] = { fg = c.yellow },
    ["@comment.warning"] = { fg = c.orange },
    ["@comment.todo"] = { fg = c.todo },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "@keyword" },

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = { },
    ["@operator"] = { fg = c.cyan }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = c.cyan }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.fg_dark }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = c.cyan }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@markup.list"] = { fg = c.cyan }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = c.orange, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.html"] = { fg = c.dark_yellow },
    ["@string.regexp"] = { fg = c.cyan }, -- For regexes.
    ["@string.escape"] = { fg = c.magenta }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.magenta }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = c.purple }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = util.lighten(c.purple, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.green, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = c.magenta, style = options.styles.functions }, -- For keywords used to define a fuction.

    ["@label"] = { fg = c.cyan }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = util.darken(c.cyan, 0.8) },
    ["@variable.member"] = { fg = c.purple }, -- For fields.
    ["@property"] = { fg = c.purple },

    --- Identifiers
    ["@variable"] = { fg = c.cyan, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@markup.raw.markdown"] = { fg = c.cyan },
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.cyan },
    ["@markup.link"] = { fg = c.cyan },

    ["@markup.list.unchecked"] = { fg = c.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.purple }, -- For brackets and parens.

    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    ["@module"] = { link = "Include" },

    -- tsx
    ["@tag.tsx"] = { fg = c.red },
    ["@constructor.tsx"] = { fg = c.cyan },
    ["@tag.delimiter.tsx"] = { fg = util.darken(c.cyan, 0.7) },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.interface"] = { fg = util.lighten(c.cyan, 0.7) },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.red },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.cyan, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.cyan, 0.8) },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
    -- NOTE: maybe add these with distinct highlights?
    -- ["@lsp.typemod.variable.globalScope"] (global variables)

    -- Python
    ["@lsp.type.namespace.python"] = { link = "@variable" },

    -- ts-rainbow
    rainbowcol1 = { fg = c.red },
    rainbowcol2 = { fg = c.yellow },
    rainbowcol3 = { fg = c.purple },
    rainbowcol4 = { fg = c.cyan },
    rainbowcol5 = { fg = c.cyan },
    rainbowcol6 = { fg = c.magenta },
    rainbowcol7 = { fg = c.green },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = c.red },
    TSRainbowOrange = { fg = c.orange },
    TSRainbowYellow = { fg = c.yellow },
    TSRainbowGreen = { fg = c.purple },
    TSRainbowBlue = { fg = c.cyan },
    TSRainbowViolet = { fg = c.green },
    TSRainbowCyan = { fg = c.dark_cyan },

    -- rainbow-delimiters
    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterGreen = { fg = c.purple },
    RainbowDelimiterBlue = { fg = c.cyan },
    RainbowDelimiterViolet = { fg = c.green },
    RainbowDelimiterCyan = { fg = c.dark_cyan },

    -- LspTrouble
    TroubleText = { fg = c.fg_dark },
    TroubleCount = { fg = c.magenta, bg = c.fg_gutter },
    TroubleNormal = { fg = c.fg, bg = bg_float_configured },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },
    IlluminatedWordText = { bg = c.fg_gutter },
    IlluminatedWordRead = { bg = c.fg_gutter },
    IlluminatedWordWrite = { bg = c.fg_gutter },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.cyan },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.magenta },

    -- Diffview
    DiffviewDiffText = { fg = c.fg, bg = c.magenta3 },

    -- Neogit
    NeogitBranch = { fg = c.magenta },
    NeogitRemote = { fg = c.green },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.cyan },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- Neotest
    NeotestPassed = { fg = c.purple },
    NeotestRunning = { fg = c.yellow },
    NeotestFailed = { fg = c.red },
    NeotestSkipped = { fg = c.cyan },
    NeotestTest = { fg = c.fg_sidebar },
    NeotestNamespace = { fg = c.purple },
    NeotestFocused = { fg = c.yellow },
    NeotestFile = { fg = c.cyan },
    NeotestDir = { fg = c.cyan },
    NeotestBorder = { fg = c.cyan },
    NeotestIndent = { fg = c.fg_sidebar },
    NeotestExpandMarker = { fg = c.fg_sidebar },
    NeotestAdapterName = { fg = c.green, bold = true },
    NeotestWinSelect = { fg = c.cyan },
    NeotestMarked = { fg = c.cyan },
    NeotestTarget = { fg = c.cyan },
    --[[ NeotestUnknown = {}, ]]

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
    GitGutterAddLineNr = { fg = c.gitSigns.add },
    GitGutterChangeLineNr = { fg = c.gitSigns.change },
    GitGutterDeleteLineNr = { fg = c.gitSigns.delete },

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- mini.diff
    MiniDiffSignAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    MiniDiffSignChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    MiniDiffSignDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = c.green },
    TelescopePromptBorder = { fg = c.cyan },
    TelescopeResultsBorder = { fg = c.green },
    TelescopePreviewBorder = { fg = c.green },
    TelescopeSelection = { fg = c.fg, bg = c.dark5 },
    TelescopeMultiSelection = { fg = c.green, bg = c.dark5 },
    TelescopeNormal = { fg = c.fg, bg = c.bg },
    TelescopeMatching = { fg = c.pink },
    TelescopePromptPrefix = { fg = c.green },
    TelescopeResultsDiffDelete = { fg = c.red },
    TelescopeResultsDiffChange = { fg = c.cyan },
    TelescopeResultsDiffAdd = { fg = c.pink },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and c.border or c.bg_sidebar,
      bg = c.bg_sidebar,
    },
    NvimTreeNormalNC = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NvimTreeRootFolder = { fg = c.cyan, bold = true },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeOpenedFile = { bg = c.bg_highlight },
    NvimTreeSpecialFile = { fg = c.green, underline = true },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.cyan },
    NvimTreeFolderIcon = { bg = c.none, fg = c.cyan },

    NeoTreeNormal = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NeoTreeNormalNC = { fg = c.fg_sidebar, bg = options.transparent and c.none or c.bg_sidebar },
    NeoTreeDimText = { fg = c.fg_gutter },
    NeoTreeTitleBar = { link = "NeoTreeNormalNC" },
    NeoTreeFloatBorder = { link = "NeoTreeNormalNC" },

    -- Fern
    FernBranchText = { fg = c.cyan },

    -- glyph palette
    GlyphPalette1 = { fg = c.red },
    GlyphPalette2 = { fg = c.purple },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.cyan },
    GlyphPalette6 = { fg = c.purple },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.red },

    -- Dashboard
    DashboardShortCut = { fg = c.dark_cyan },
    DashboardHeader = { fg = c.green },
    DashboardCenter = { fg = c.magenta },
    DashboardFooter = { fg = c.dark_cyan },
    DashboardKey = { fg = c.purple },
    DashboardDesc = { fg = c.cyan },
    DashboardIcon = { fg = c.green, bold = true },

    -- Alpha
    AlphaShortcut = { fg = c.orange },
    AlphaHeader = { fg = c.cyan },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter = { fg = c.cyan },
    AlphaButtons = { fg = c.dark_cyan },

    -- WhichKey
    WhichKey = { fg = c.dark_cyan },
    WhichKeyGroup = { fg = c.cyan },
    WhichKeyDesc = { fg = c.green },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = bg_float_configured },
    WhichKeyValue = { fg = c.dark5 },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { fg = colors.fg, bg = bg_float_configured },
    LspFloatWinBorder = { fg = colors.green },
    LspSagaHoverBorder = { fg = colors.green },
    LspSagaSignatureHelpBorder = { fg = colors.green },
    LspSagaCodeActionBorder = { fg = colors.green },
    LspSagaDefPreviewBorder = { fg = colors.green },
    LspLinesDiagBorder = { fg = colors.green },
    LspSagaRenameBorder = { fg = colors.green },
    LspSagaBorderTitle = { fg = colors.cyan },
    LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
    LspSagaDiagnosticBorder = { fg = colors.green },
    LspSagaShTruncateLine = { fg = colors.comment },
    LspSagaDocTruncateLine = { fg = colors.comment },
    LspSagaLspFinderBorder = { fg = colors.green },
    CodeActionNumber = { bg = "NONE", fg = colors.cyan },
    ReferencesCount = { fg = c.green },
    DefinitionCount = { fg = c.green },
    DefinitionIcon = { fg = c.cyan },
    ReferencesIcon = { fg = c.cyan },
    TargetWord = { fg = c.dark_cyan },

    -- NeoVim
    healthError = { fg = c.red },
    healthSuccess = { fg = c.purple },
    healthWarning = { fg = c.orange },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },

    -- Barbar
    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.red },
    BufferCurrentHINT = { bg = c.bg, fg = c.pink },
    -- BufferCurrentIcon = { bg = c.bg, fg = c.},
    BufferCurrentINFO = { bg = c.bg, fg = c.yellow },
    BufferCurrentWARN = { bg = c.bg, fg = c.orange },
    BufferCurrentIndex = { bg = c.bg, fg = c.yellow },
    BufferCurrentMod = { bg = c.bg, fg = c.orange },
    BufferCurrentSign = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.red },
    BufferAlternate = { bg = c.fg_gutter, fg = c.fg },
    BufferAlternateERROR = { bg = c.fg_gutter, fg = c.red },
    BufferAlternateHINT = { bg = c.fg_gutter, fg = c.pink },
    -- BufferAlternateIcon = { bg = c.fg_gutter, fg = c. },
    BufferAlternateIndex = { bg = c.fg_gutter, fg = c.yellow },
    BufferAlternateINFO = { bg = c.fg_gutter, fg = c.yellow },
    BufferAlternateMod = { bg = c.fg_gutter, fg = c.orange },
    BufferAlternateSign = { bg = c.fg_gutter, fg = c.yellow },
    BufferAlternateTarget = { bg = c.fg_gutter, fg = c.red },
    BufferAlternateWARN = { bg = c.fg_gutter, fg = c.orange },
    BufferVisible = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleERROR = { bg = c.bg_statusline, fg = c.red },
    BufferVisibleHINT = { bg = c.bg_statusline, fg = c.pink },
    -- BufferVisibleIcon = { bg = c.bg_statusline, fg = c. },
    BufferVisibleINFO = { bg = c.bg_statusline, fg = c.yellow },
    BufferVisibleWARN = { bg = c.bg_statusline, fg = c.orange },
    BufferVisibleIndex = { bg = c.bg_statusline, fg = c.yellow },
    BufferVisibleMod = { bg = c.bg_statusline, fg = c.orange },
    BufferVisibleSign = { bg = c.bg_statusline, fg = c.yellow },
    BufferVisibleTarget = { bg = c.bg_statusline, fg = c.red },
    BufferInactive = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.dark5, 0.8) },
    BufferInactiveERROR = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.red, 0.8) },
    BufferInactiveHINT = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.pink, 0.8) },
    -- BufferInactiveIcon = { bg = c.bg_statusline, fg = util.darken(c., 0.1) },
    BufferInactiveINFO = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.yellow, 0.8) },
    BufferInactiveWARN = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.orange, 0.8) },
    BufferInactiveIndex = { bg = util.darken(c.bg_highlight, 0.4), fg = c.dark5 },
    BufferInactiveMod = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.orange, 0.8) },
    BufferInactiveSign = { bg = util.darken(c.bg_highlight, 0.4), fg = c.bg },
    BufferInactiveTarget = { bg = util.darken(c.bg_highlight, 0.4), fg = c.red },
    BufferOffset = { bg = c.bg_statusline, fg = c.dark5 },
    BufferTabpageFill = { bg = util.darken(c.bg_highlight, 0.8), fg = c.dark5 },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },

    -- Sneak
    Sneak = { fg = c.bg_highlight, bg = c.magenta },
    SneakScope = { bg = c.bg_visual },

    -- Hop
    HopNextKey = { fg = c.magenta2, bold = true },
    HopNextKey1 = { fg = c.cyan, bold = true },
    HopNextKey2 = { fg = util.darken(c.cyan, 0.6) },
    HopUnmatched = { fg = c.dark3 },

    TSNodeKey = { fg = c.magenta2, bold = true },
    TSNodeUnmatched = { fg = c.dark3 },

    LeapMatch = { bg = c.magenta2, fg = c.fg, bold = true },
    LeapLabelPrimary = { fg = c.magenta2, bold = true },
    LeapLabelSecondary = { fg = c.purple, bold = true },
    LeapBackdrop = { fg = c.dark3 },

    FlashBackdrop = { fg = c.dark3 },
    FlashLabel = { bg = c.green, bold = true, fg = c.black },
    FlashCurrent = { bg = c.bg_highlight, bold = true, fg = c.purple },
    FlashMatch = { bg = c.bg_highlight, bold = true, fg = c.pink },

    LightspeedGreyWash = { fg = c.dark3 },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.magenta2, bold = true, underline = true },
    LightspeedLabelDistant = { fg = c.purple, bold = true, underline = true },
    LightspeedLabelDistantOverlapped = { fg = c.purple, underline = true },
    LightspeedLabelOverlapped = { fg = c.magenta2, underline = true },
    LightspeedMaskedChar = { fg = c.orange },
    LightspeedOneCharMatch = { bg = c.magenta2, fg = c.fg, bold = true },
    LightspeedPendingOpArea = { bg = c.magenta2, fg = c.fg },
    LightspeedShortcut = { bg = c.magenta2, fg = c.fg, bold = true, underline = true },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.cyan, bold = true },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = bg_float_configured },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = bg_float_configured },
    CmpGhostText = { fg = c.terminal_black },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.cyan, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },

    CmpItemKindCodeium = { fg = c.cyan, bg = c.none },
    CmpItemKindCopilot = { fg = c.cyan, bg = c.none },
    CmpItemKindTabNine = { fg = c.cyan, bg = c.none },

    -- headlines.nvim
    CodeBlock = { bg = c.bg_highlight },

    -- navic
    NavicSeparator = { fg = c.fg, bg = c.none },
    NavicText = { fg = c.fg, bg = c.none },

    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide = { fg = c.fg_gutter },
    AerialLine = { link = "LspInlayHint" },

    IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true },
    IndentBlanklineContextChar = { fg = c.green, nocombine = true },
    IndentBlankLineScopeParent = { fg = c.fg, bg = c.magenta3 },
    IblIndent = { fg = c.fg_gutter, nocombine = true },
    IblScope = { fg = c.green, nocombine = true },

    -- Scrollbar
    ScrollbarHandle = { fg = c.none, bg = c.bg_highlight },

    ScrollbarSearchHandle = { fg = c.orange, bg = c.bg_highlight },
    ScrollbarSearch = { fg = c.orange, bg = c.none },

    ScrollbarErrorHandle = { fg = c.red, bg = c.bg_highlight },
    ScrollbarError = { fg = c.red, bg = c.none },

    ScrollbarWarnHandle = { fg = c.orange, bg = c.bg_highlight },
    ScrollbarWarn = { fg = c.orange, bg = c.none },

    ScrollbarInfoHandle = { fg = c.yellow, bg = c.bg_highlight },
    ScrollbarInfo = { fg = c.yellow, bg = c.none },

    ScrollbarHintHandle = { fg = c.pink, bg = c.bg_highlight },
    ScrollbarHint = { fg = c.pink, bg = c.none },

    ScrollbarMiscHandle = { fg = c.green, bg = c.bg_highlight },
    ScrollbarMisc = { fg = c.green, bg = c.none },

    -- Yanky
    YankyPut = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.magenta2 },
    LazyProgressTodo = { bold = true, fg = c.fg_gutter },

    -- Notify
    NotifyBackground = { fg = c.fg, bg = bg_float_configured },
    --- Border
    NotifyERRORBorder = { fg = util.darken(c.red, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyWARNBorder = { fg = util.darken(c.orange, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyINFOBorder = { fg = util.darken(c.yellow, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = util.darken(c.comment, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = util.darken(c.green, 0.3), bg = options.transparent and c.none or c.bg },
    --- Icons
    NotifyERRORIcon = { fg = c.red },
    NotifyWARNIcon = { fg = c.orange },
    NotifyINFOIcon = { fg = c.yellow },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.green },
    --- Title
    NotifyERRORTitle = { fg = c.red },
    NotifyWARNTitle = { fg = c.orange },
    NotifyINFOTitle = { fg = c.yellow },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyTRACETitle = { fg = c.green },
    --- Body
    NotifyERRORBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyWARNBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyINFOBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyTRACEBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },

    -- Mini
    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = c.fg_gutter },
    MiniCursorwordCurrent = { bg = c.fg_gutter },

    MiniIndentscopeSymbol = { fg = c.cyan, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = c.magenta2, fg = "#ffffff" },

    MiniJump2dSpot = { fg = c.magenta2, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.yellow, italic = true },
    MiniStarterHeader = { fg = c.cyan },
    MiniStarterInactive = { fg = c.comment, style = options.styles.comments },
    MiniStarterItem = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border_highlight },
    MiniStarterItemPrefix = { fg = c.orange },
    MiniStarterSection = { fg = c.cyan },
    MiniStarterQuery = { fg = c.yellow },

    MiniStatuslineDevinfo = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFileinfo = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFilename = { fg = c.fg_dark, bg = c.fg_gutter },
    MiniStatuslineInactive = { fg = c.cyan, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.purple, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.cyan, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.cyan, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },

    MiniSurround = { bg = c.orange, fg = c.black },

    MiniTablineCurrent = { fg = c.fg, bg = c.fg_gutter },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.dark5, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.orange, bg = c.fg_gutter },
    MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = util.darken(c.orange, 0.7) },
    MiniTablineModifiedVisible = { fg = c.orange, bg = c.bg_statusline },
    MiniTablineTabpagesection = { bg = c.bg_statusline, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.bg_statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.purple, bold = true },

    MiniTrailspace = { bg = c.red },

    -- Noice
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
    -- Default
    NoiceCmdline = { fg = c.green, bg = bg_float_configured },
    NoiceCmdlineIcon = { fg = c.green, bg = bg_float_configured },
    NoiceCmdlinePopupBorder = { fg = c.green, bg = bg_float_configured },
    NoiceCmdlinePopupTitle = { fg = c.green, bg = bg_float_configured },
    -- Filter (shell command)
    NoiceCmdlinePopupBorderFilter = { fg = c.pink, bg = bg_float_configured },
    NoiceCmdlineIconFilter = { fg = c.pink, bg = bg_float_configured },
    -- Lua
    NoiceCmdlinePopupBorderLua = { fg = c.dark_cyan },
    NoiceCmdlineIconLua = { fg = c.dark_cyan },
    -- Help
    NoiceCmdlinePopupBorderHelp = { fg = c.yellow },
    NoiceCmdlineIconHelp = { fg = c.yellow },
    -- LspProgress
    NoiceLspProgressSpinner = { fg = c.cyan },
    NoiceLspProgressTitle = { fg = c.green },
    NoiceLspProgressClient = { fg = c.purple },
    NoiceMini = { bg = c.bg_highlight },

    TreesitterContext = { bg = util.darken(c.fg_gutter, 0.8) },
    Hlargs = { fg = c.yellow },
    -- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
  }

  -- lsp symbol kind and completion kind highlights
  local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@variable.member",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@variable.member",
    Keyword = "@lsp.type.keyword",
    Method = "@function.method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@markup",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
  }

  local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
  for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    theme.highlights[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
      theme.highlights[plugin:format(kind)] = { link = base }
    end
  end

  local markdown_rainbow = { c.cyan, c.yellow, c.purple, c.cyan, c.magenta, c.green }

  for i, color in ipairs(markdown_rainbow) do
    theme.highlights["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
    theme.highlights["Headline" .. i] = { bg = util.darken(color, 0.05) }
  end
  theme.highlights["Headline"] = { link = "Headline1" }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  ---@type table<string, table>
  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end

    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

  -- Use #000000 for full transparency
  if options.transparent then
    theme.highlights.NotifyBackground = { bg = "#000000" }
  end

  return theme
end

return M
