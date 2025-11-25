local M = {}

M.url = "https://github.com/nvimdev/lspsaga.nvim"

---@type eldritch.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    DiagnosticWarning           = "DiagnosticWarn",
    DiagnosticInformation       = "DiagnosticInfo",
    LspFloatWinNormal           = { fg = c.fg, bg = c.bg_float },
    LspFloatWinBorder           = { fg = c.green },
    LspSagaHoverBorder          = { fg = c.green },
    LspSagaSignatureHelpBorder  = { fg = c.green },
    LspSagaCodeActionBorder     = { fg = c.green },
    LspSagaDefPreviewBorder     = { fg = c.green },
    LspLinesDiagBorder          = { fg = c.green },
    LspSagaRenameBorder         = { fg = c.green },
    LspSagaBorderTitle          = { fg = c.cyan },
    LSPSagaDiagnosticTruncateLine = { fg = c.comment },
    LspSagaDiagnosticBorder     = { fg = c.green },
    LspSagaShTruncateLine       = { fg = c.comment },
    LspSagaDocTruncateLine      = { fg = c.comment },
    LspSagaLspFinderBorder      = { fg = c.green },
    CodeActionNumber            = { bg = "NONE", fg = c.cyan },
    ReferencesCount             = { fg = c.green },
    DefinitionCount             = { fg = c.green },
    DefinitionIcon              = { fg = c.cyan },
    ReferencesIcon              = { fg = c.cyan },
    TargetWord                  = { fg = c.dark_cyan },
  }
end

return M
