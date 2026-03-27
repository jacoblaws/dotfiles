local M = {}

-- stylua: ignore start

function M.get(spec)
  local syn, diag, git = spec.syntax, spec.diagnostics, spec.git
  return {
    Comment        = { fg = syn.comment, italic = true },
    Constant       = { fg = syn.const },
    String         = { fg = syn.string },
    Character      = { link = 'String' },
    Number         = { fg = syn.number },
    Boolean        = { link = 'Number' },
    Float          = { link = 'Number' },
    Identifier     = { fg = syn.ident },
    Function       = { fg = syn.fun },
    Statement      = { fg = syn.statement },
    Conditional    = { link = 'Statement' },
    Repeat         = { link = 'Statement' },
    Label          = { fg = syn.label },
    Operator       = { fg = syn.operator },
    Keyword        = { fg = syn.keyword },
    Exception      = { link = 'Keyword'},
    PreProc        = { fg = syn.preproc },
    Include        = { link = 'PreProc' },
    Define         = { link = 'PreProc' },
    Macro          = { fg = syn.macro },
    PreCondit      = { link = 'PreProc' },
    Type           = { fg = syn.type },
    StorageClass   = { link = 'Label' },
    Structure      = { link = 'Label' },
    Typedef        = { link = 'Keyword' },
    Special        = { fg = syn.special },
    SpecialChar    = { link = 'Special' },
    Tag            = { link = 'Label' },
    Delimiter      = { fg = syn.delim },
    SpecialComment = { link = 'Comment' },
    Debug          = { link = 'Label' },
    Underlined     = { underline = true },
    Bold           = { bold = true },
    Italic         = { italic = true },
    Ignore         = { link = 'Comment' },
    Error          = { fg = diag.error },
    Todo           = { fg = spec.bg0, bg = diag.info, bold = true },
    Added          = { fg = git.added },
    Changed        = { fg = git.changed },
    Removed        = { fg = git.removed },
  }
end

-- stylua: ignore end

return M
