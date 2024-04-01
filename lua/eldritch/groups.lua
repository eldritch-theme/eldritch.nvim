---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs EldritchConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
  local colors = configs.colors
  local endOfBuffer = {
    fg = configs.show_end_of_buffer and colors.visual or colors.bg,
  }

  return {
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.comment, italic = configs.italic_comment },
    Constant = { fg = colors.yellow },
    String = { fg = colors.yellow },
    Character = { fg = colors.pink },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.cyan },
    Float = { fg = colors.orange },
    FloatBorder = { fg = colors.green },
    Operator = { fg = colors.green },
    Keyword = { fg = colors.cyan },
    Keywords = { fg = colors.cyan },
    Identifier = { fg = colors.cyan },
    Function = { fg = colors.yellow },
    Statement = { fg = colors.green },
    Conditional = { fg = colors.purple },
    Repeat = { fg = colors.purple },
    Label = { fg = colors.cyan },
    Exception = { fg = colors.green },
    PreProc = { fg = colors.yellow },
    Include = { fg = colors.green },
    Define = { fg = colors.green },
    Title = { fg = colors.cyan },
    Macro = { fg = colors.green },
    PreCondit = { fg = colors.cyan },
    Type = { fg = colors.orange },
    StorageClass = { fg = colors.purple },
    Structure = { fg = colors.yellow },
    TypeDef = { fg = colors.yellow },
    Special = { fg = colors.pink, italic = true },
    SpecialComment = { fg = colors.comment, italic = true },
    Error = { fg = colors.bright_red },
    Todo = { fg = colors.green, bold = true, italic = true },
    Underlined = { fg = colors.cyan, underline = true },

    Cursor = { reverse = true },
    CursorLineNr = { fg = colors.green, bold = true },

    SignColumn = { bg = colors.bg },

    Conceal = { fg = colors.comment },
    CursorColumn = { bg = colors.black },
    CursorLine = { bg = colors.selection },
    ColorColumn = { bg = colors.selection },

    StatusLine = { fg = colors.white, bg = colors.black },
    StatusLineNC = { fg = colors.comment },
    StatusLineTerm = { fg = colors.white, bg = colors.black },
    StatusLineTermNC = { fg = colors.comment },

    Directory = { fg = colors.cyan },
    DiffAdd = { fg = colors.bg, bg = colors.pink },
    DiffChange = { fg = colors.orange },
    DiffDelete = { fg = colors.red },
    DiffText = { fg = colors.comment },

    ErrorMsg = { fg = colors.bright_red },
    VertSplit = { fg = colors.black },
    WinSeparator = { fg = colors.black },
    Folded = { fg = colors.comment },
    FoldColumn = {},
    Search = { fg = colors.black, bg = colors.orange },
    IncSearch = { fg = colors.orange, bg = colors.comment },
    LineNr = { fg = colors.comment },
    MatchParen = { fg = colors.fg, underline = true },
    NonText = { fg = colors.nontext },
    Pmenu = { fg = colors.white, bg = colors.menu },
    PmenuSel = { fg = colors.white, bg = colors.selection },
    PmenuSbar = { bg = colors.bg },
    PmenuThumb = { bg = colors.selection },

    Question = { fg = colors.green },
    QuickFixLine = { fg = colors.black, bg = colors.yellow },
    SpecialKey = { fg = colors.nontext },

    SpellBad = { fg = colors.bright_red, underline = true },
    SpellCap = { fg = colors.yellow },
    SpellLocal = { fg = colors.yellow },
    SpellRare = { fg = colors.yellow },

    TabLine = { fg = colors.comment },
    TabLineSel = { fg = colors.white },
    TabLineFill = { bg = colors.bg },
    Terminal = { fg = colors.white, bg = colors.black },
    Visual = { bg = colors.visual },
    VisualNOS = { fg = colors.visual },
    WarningMsg = { fg = colors.yellow },
    WildMenu = { fg = colors.black, bg = colors.white },

    EndOfBuffer = endOfBuffer,

    -- TreeSitter
    ["@error"] = { fg = colors.bright_red },
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@markup.list"] = { fg = colors.cyan },

    ["@constant"] = { fg = colors.bright_cyan },
    ["@constant.builtin"] = { fg = colors.bright_cyan },
    ["@markup.link.label.symbol"] = { fg = colors.bright_cyan },

    ["@constant.macro"] = { fg = colors.cyan },
    ["@string.regexp"] = { fg = colors.yellow },
    ["@string"] = { fg = colors.yellow },
    ["@string.escape"] = { fg = colors.cyan },
    ["@string.special.symbol"] = { fg = colors.green },
    ["@character"] = { fg = colors.pink },
    ["@number"] = { fg = colors.green },
    ["@boolean"] = { fg = colors.green },
    ["@number.float"] = { fg = colors.pink },
    ["@annotation"] = { fg = colors.yellow },
    ["@attribute"] = { fg = colors.cyan },
    ["@module"] = { fg = colors.orange },

    ["@function.builtin"] = { fg = colors.cyan },
    ["@function"] = { fg = colors.purple },
    ["@function.macro"] = { fg = colors.purple },
    ["@variable.parameter"] = { fg = colors.orange },
    ["@variable.parameter.reference"] = { fg = colors.orange },
    ["@function.method"] = { fg = colors.purple },
    ["@variable.member"] = { fg = colors.orange },
    ["@property"] = { fg = colors.bright_green },
    ["@constructor"] = { fg = colors.cyan },

    ["@keyword.conditional"] = { fg = colors.purple },
    ["@keyword.repeat"] = { fg = colors.purple },
    ["@label"] = { fg = colors.cyan },

    ["@keyword"] = { fg = colors.green },
    ["@keyword.function"] = { fg = colors.cyan },
    ["@keyword.function.ruby"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.purple },
    ["@operator"] = { fg = colors.purple },
    ["@keyword.exception"] = { fg = colors.green },
    ["@type"] = { fg = colors.bright_purple },
    ["@type.builtin"] = { fg = colors.cyan, italic = true },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@type.def"] = { fg = colors.yellow },
    ["@structure"] = { fg = colors.green },
    ["@keyword.include"] = { fg = colors.purple },

    ["@variable"] = { fg = colors.red },
    ["@variable.builtin"] = { fg = colors.green },

    ["@markup"] = { fg = colors.orange },
    ["@markup.strong"] = { fg = colors.orange, bold = true }, -- bold
    ["@markup.emphasis"] = { fg = colors.yellow, italic = true }, -- italic
    ["@markup.underline"] = { fg = colors.orange },
    ["@markup.heading"] = { fg = colors.purple, bold = true }, -- title
    ["@markup.raw"] = { fg = colors.yellow }, -- inline code
    ["@markup.link.url"] = { fg = colors.yellow, italic = true }, -- urls
    ["@markup.link"] = { fg = colors.orange, bold = true },

    ["@tag"] = { fg = colors.cyan },
    ["@tag.attribute"] = { fg = colors.pink },
    ["@tag.delimiter"] = { fg = colors.cyan },

    -- Semantic
    ["@class"] = { fg = colors.cyan },
    ["@struct"] = { fg = colors.cyan },
    ["@enum"] = { fg = colors.cyan },
    ["@enumMember"] = { fg = colors.green },
    ["@event"] = { fg = colors.cyan },
    ["@interface"] = { fg = colors.cyan },
    ["@modifier"] = { fg = colors.cyan },
    ["@regexp"] = { fg = colors.yellow },
    ["@typeParameter"] = { fg = colors.cyan },
    ["@decorator"] = { fg = colors.cyan },

    -- LSP Semantic (0.9+)
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
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.def" },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
    ["@lsp.type.namespace.python"] = { link = "@variable" },

    -- HTML
    htmlArg = { fg = colors.pink },
    htmlBold = { fg = colors.yellow, bold = true },
    htmlEndTag = { fg = colors.cyan },
    htmlH1 = { fg = colors.purple },
    htmlH2 = { fg = colors.purple },
    htmlH3 = { fg = colors.purple },
    htmlH4 = { fg = colors.purple },
    htmlH5 = { fg = colors.purple },
    htmlH6 = { fg = colors.purple },
    htmlItalic = { fg = colors.green, italic = true },
    htmlLink = { fg = colors.green, underline = true },
    htmlSpecialChar = { fg = colors.yellow },
    htmlSpecialTagName = { fg = colors.cyan },
    htmlTag = { fg = colors.cyan },
    htmlTagN = { fg = colors.cyan },
    htmlTagName = { fg = colors.cyan },
    htmlTitle = { fg = colors.white },

    -- Markdown
    markdownBlockquote = { fg = colors.yellow, italic = true },
    markdownBold = { fg = colors.orange, bold = true },
    markdownCode = { fg = colors.pink },
    markdownCodeBlock = { fg = colors.orange },
    markdownCodeDelimiter = { fg = colors.red },
    markdownH1 = { fg = colors.purple, bold = true },
    markdownH2 = { fg = colors.purple, bold = true },
    markdownH3 = { fg = colors.purple, bold = true },
    markdownH4 = { fg = colors.purple, bold = true },
    markdownH5 = { fg = colors.purple, bold = true },
    markdownH6 = { fg = colors.purple, bold = true },
    markdownHeadingDelimiter = { fg = colors.red },
    markdownHeadingRule = { fg = colors.comment },
    markdownId = { fg = colors.green },
    markdownIdDeclaration = { fg = colors.cyan },
    markdownIdDelimiter = { fg = colors.green },
    markdownItalic = { fg = colors.yellow, italic = true },
    markdownLinkDelimiter = { fg = colors.green },
    markdownLinkText = { fg = colors.purple },
    markdownListMarker = { fg = colors.cyan },
    markdownOrderedListMarker = { fg = colors.red },
    markdownRule = { fg = colors.comment },

    --  Diff
    diffAdded = { fg = colors.pink },
    diffRemoved = { fg = colors.red },
    diffFileId = { fg = colors.yellow, bold = true, reverse = true },
    diffFile = { fg = colors.nontext },
    diffNewFile = { fg = colors.pink },
    diffOldFile = { fg = colors.red },

    debugPc = { bg = colors.menu },
    debugBreakpoint = { fg = colors.red, reverse = true },

    -- Git Signs
    GitSignsAdd = { fg = colors.bright_cyan },
    GitSignsChange = { fg = colors.cyan },
    GitSignsDelete = { fg = colors.bright_red },
    GitSignsAddLn = { fg = colors.black, bg = colors.bright_cyan },
    GitSignsChangeLn = { fg = colors.black, bg = colors.cyan },
    GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red },
    GitSignsCurrentLineBlame = { fg = colors.white },

    -- Telescope
    TelescopePromptBorder = { fg = colors.cyan },
    TelescopeResultsBorder = { fg = colors.green },
    TelescopePreviewBorder = { fg = colors.green },
    TelescopeSelection = { fg = colors.white, bg = colors.selection },
    TelescopeMultiSelection = { fg = colors.green, bg = colors.selection },
    TelescopeNormal = { fg = colors.fg, bg = colors.bg },
    TelescopeMatching = { fg = colors.pink },
    TelescopePromptPrefix = { fg = colors.green },
    TelescopeResultsDiffDelete = { fg = colors.red },
    TelescopeResultsDiffChange = { fg = colors.cyan },
    TelescopeResultsDiffAdd = { fg = colors.pink },

    -- Flash
    FlashLabel = { bg = colors.red, fg = colors.bright_white },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.menu },
    NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
    NvimTreeRootFolder = { fg = colors.fg, bold = true },
    NvimTreeGitDirty = { fg = colors.yellow },
    NvimTreeGitNew = { fg = colors.bright_cyan },
    NvimTreeImageFile = { fg = colors.purple },
    NvimTreeFolderIcon = { fg = colors.green },
    NvimTreeIndentMarker = { fg = colors.nontext },
    NvimTreeEmptyFolderName = { fg = colors.comment },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeSpecialFile = { fg = colors.purple, underline = true },
    NvimTreeOpenedFolderName = { fg = colors.fg },
    NvimTreeCursorLine = { bg = colors.selection },
    NvimTreeIn = { bg = colors.selection },

    NvimTreeEndOfBuffer = endOfBuffer,

    -- NeoTree
    NeoTreeNormal = { fg = colors.fg, bg = colors.menu },
    NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu },
    NeoTreeDirectoryName = { fg = colors.fg },
    NeoTreeGitUnstaged = { fg = colors.bright_magenta },
    NeoTreeGitModified = { fg = colors.bright_magenta },
    NeoTreeGitUntracked = { fg = colors.bright_cyan },
    NeoTreeDirectoryIcon = { fg = colors.green },
    NeoTreeIndentMarker = { fg = colors.nontext },
    NeoTreeDotfile = { fg = colors.comment },

    -- Bufferline
    BufferLineIndicatorSelected = { fg = colors.green },
    BufferLineFill = { bg = colors.bg },
    BufferLineBufferSelected = { bg = colors.bg },
    BufferLineSeparator = { fg = colors.black },

    -- LSP
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticHint = { fg = colors.cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.yellow },
    DiagnosticSignInfo = { fg = colors.cyan },
    DiagnosticSignHint = { fg = colors.cyan },
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingWarn = { fg = colors.yellow },
    DiagnosticFloatingInfo = { fg = colors.cyan },
    DiagnosticFloatingHint = { fg = colors.cyan },
    DiagnosticVirtualTextError = { fg = colors.red },
    DiagnosticVirtualTextWarn = { fg = colors.yellow },
    DiagnosticVirtualTextInfo = { fg = colors.cyan },
    DiagnosticVirtualTextHint = { fg = colors.cyan },

    LspDiagnosticsDefaultError = { fg = colors.red },
    LspDiagnosticsDefaultWarning = { fg = colors.yellow },
    LspDiagnosticsDefaultInformation = { fg = colors.cyan },
    LspDiagnosticsDefaultHint = { fg = colors.cyan },
    LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true },
    LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true },
    LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true },
    LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true },
    LspReferenceText = { fg = colors.orange },
    LspReferenceRead = { fg = colors.orange },
    LspReferenceWrite = { fg = colors.orange },
    LspCodeLens = { fg = colors.cyan },
    LspInlayHint = { fg = "#969696", bg = "#2f3146" },

    --LSP Saga
    LspFloatWinNormal = { fg = colors.fg },
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

    -- IndentBlankLine
    IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true },

    -- Nvim compe
    CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg },
    CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.bg },

    -- barbar
    BufferVisibleTarget = { fg = colors.red },
    BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
    BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
    BufferCurrentSign = { fg = colors.green },
    BufferCurrentTarget = { fg = colors.red },
    BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
    BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
    BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = true },
    BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
    BufferInactiveTarget = { fg = colors.red, bg = colors.black, bold = true },

    -- Compe
    CompeDocumentation = { link = "Pmenu" },
    CompeDocumentationBorder = { link = "Pmenu" },

    -- Cmp
    CmpItemAbbr = { fg = colors.white, bg = colors.bg },
    CmpItemKind = { fg = colors.white, bg = colors.bg },
    CmpItemKindMethod = { link = "@function.method" },
    CmpItemKindText = { link = "@markup" },
    CmpItemKindFunction = { link = "@function" },
    CmpItemKindConstructor = { link = "@type" },
    CmpItemKindVariable = { link = "@variable" },
    CmpItemKindClass = { link = "@type" },
    CmpItemKindInterface = { link = "@type" },
    CmpItemKindModule = { link = "@module" },
    CmpItemKindProperty = { link = "@property" },
    CmpItemKindOperator = { link = "@operator" },
    CmpItemKindReference = { link = "@variable.parameter.reference" },
    CmpItemKindUnit = { link = "@variable.member" },
    CmpItemKindValue = { link = "@variable.member" },
    CmpItemKindField = { link = "@variable.member" },
    CmpItemKindEnum = { link = "@variable.member" },
    CmpItemKindKeyword = { link = "@keyword" },
    CmpItemKindSnippet = { link = "@markup" },
    CmpItemKindColor = { link = "DevIconCss" },
    CmpItemKindFile = { link = "TSURI" },
    CmpItemKindFolder = { link = "TSURI" },
    CmpItemKindEvent = { link = "@constant" },
    CmpItemKindEnumMember = { link = "@variable.member" },
    CmpItemKindConstant = { link = "@constant" },
    CmpItemKindStruct = { link = "@structure" },
    CmpItemKindTypeParameter = { link = "@variable.parameter" },

    -- navic
    NavicIconsFile = { link = "CmpItemKindFile" },
    NavicIconsModule = { link = "CmpItemKindModule" },
    NavicIconsNamespace = { link = "CmpItemKindModule" },
    NavicIconsPackage = { link = "CmpItemKindModule" },
    NavicIconsClass = { link = "CmpItemKindClass" },
    NavicIconsMethod = { link = "CmpItemKindMethod" },
    NavicIconsProperty = { link = "CmpItemKindProperty" },
    NavicIconsField = { link = "CmpItemKindField" },
    NavicIconsConstructor = { link = "CmpItemKindConstructor" },
    NavicIconsEnum = { link = "CmpItemKindEnum" },
    NavicIconsInterface = { link = "CmpItemKindInterface" },
    NavicIconsFunction = { link = "CmpItemKindFunction" },
    NavicIconsVariable = { link = "CmpItemKindVariable" },
    NavicIconsConstant = { link = "CmpItemKindConstant" },
    NavicIconsString = { link = "String" },
    NavicIconsNumber = { link = "Number" },
    NavicIconsBoolean = { link = "Boolean" },
    NavicIconsArray = { link = "CmpItemKindClass" },
    NavicIconsObject = { link = "CmpItemKindClass" },
    NavicIconsKey = { link = "CmpItemKindKeyword" },
    NavicIconsKeyword = { link = "CmpItemKindKeyword" },
    NavicIconsNull = { fg = "blue" },
    NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
    NavicIconsStruct = { link = "CmpItemKindStruct" },
    NavicIconsEvent = { link = "CmpItemKindEvent" },
    NavicIconsOperator = { link = "CmpItemKindOperator" },
    NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
    NavicText = { fg = "gray" },
    NavicSeparator = { fg = "gray" },

    -- TS rainbow colors
    rainbowcol1 = { fg = colors.fg },
    rainbowcol2 = { fg = colors.purple },
    rainbowcol3 = { fg = colors.cyan },
    rainbowcol4 = { fg = colors.pink },
    rainbowcol5 = { fg = colors.green },
    rainbowcol6 = { fg = colors.orange },
    rainbowcol7 = { fg = colors.fg },

    -- Rainbow delimiter
    RainbowDelimiterRed = { fg = colors.fg },
    RainbowDelimiterYellow = { fg = colors.purple },
    RainbowDelimiterBlue = { fg = colors.cyan },
    RainbowDelimiterOrange = { fg = colors.pink },
    RainbowDelimitercyan = { fg = colors.green },
    RainbowDelimiterViolet = { fg = colors.orange },
    RainbowDelimiterpurple = { fg = colors.fg },

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = "#B5629B" },
    MiniIndentscopeSymbolOff = { fg = "#B5629B" },

    -- goolord/alpha-nvim
    AlphaHeader = { fg = colors.green },
    AlphaButtons = { fg = colors.cyan },
    AlphaShortcut = { fg = colors.orange },
    AlphaFooter = { fg = colors.green, italic = true },

    -- nvimdev/dashboard-nvim
    DashboardShortCut = { fg = colors.cyan },
    DashboardHeader = { fg = colors.green },
    DashboardCenter = { fg = colors.fg },
    DashboardFooter = { fg = colors.green, italic = true },
    DashboardKey = { fg = colors.orange },
    DashboardDesc = { fg = colors.cyan },
    DashboardIcon = { fg = colors.cyan, bold = true },

    -- dap UI
    DapUIPlayPause = { fg = colors.bright_cyan },
    DapUIRestart = { fg = colors.pink },
    DapUIStop = { fg = colors.red },
    DapUIStepOver = { fg = colors.cyan },
    DapUIStepInto = { fg = colors.cyan },
    DapUIStepOut = { fg = colors.cyan },
    DapUIStepBack = { fg = colors.cyan },
    DapUIType = { fg = colors.bright_blue },
    DapUIScope = { fg = colors.bright_purple },
    DapUIModifiedValue = { fg = colors.bright_purple, bold = true },
    DapUIDecoration = { fg = colors.bright_purple },
    DapUIThread = { fg = colors.bright_cyan },
    DapUIStoppedThread = { fg = colors.bright_purple },
    DapUISource = { fg = colors.bright_blue },
    DapUILineNumber = { fg = colors.bright_purple },
    DapUIFloatBorder = { fg = colors.green },
    DapUIWatchesEmpty = { fg = colors.purple },
    DapUIWatchesValue = { fg = colors.bright_cyan },
    DapUIWatchesError = { fg = colors.purple },
    DapUIBreakpointsPath = { fg = colors.bright_purple },
    DapUIBreakpointsInfo = { fg = colors.bright_cyan },
    DapUIBreakpointsCurrentLine = { fg = colors.bright_cyan, bold = true },
    DapStoppedLine = { default = true, link = "Visual" },
    DapUIWinSelect = { fg = colors.bright_purple, bold = true },

    -- Notify
    NotifyInfoIcon = { fg = colors.pink },
    NotifyInfoTitle = { fg = colors.pink },
    NotifyInfoBorder = { fg = colors.green },
    NotifyErrorIcon = { fg = colors.red },
    NotifyErrorTitle = { fg = colors.red },
    NotifyErrorBorder = { fg = "#DD6E6B" },
    NotifyWarnIcon = { fg = colors.orange },
    NotifyWarnTitle = { fg = colors.orange },
    NotifyWarnBorder = { fg = colors.yellow },
  }
end

return {
  setup = setup,
}
