local M = {}

function M.get(spec)
  local pal, syn = spec.palette, spec.syntax
  return {
    -- Identifiers ---------------------------------------------------------------------------------
    ['@variable'] = { fg = pal.fg },
    ['@variable.builtin'] = { link = 'Number' },
    ['@variable.parameter'] = { link = 'Variable' },
    ['@variable.parameter.builtin'] = { link = 'Special' },
    ['@variable.member'] = { link = 'Identifier' },

    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { fg = pal.purple },
    ['@constant.macro'] = { fg = pal.purple },

    ['@module'] = { link = 'Special' },
    ['@module.builtin'] = { link = 'Special' },
    ['@label'] = { link = 'Label' },

    -- Literals ------------------------------------------------------------------------------------
    ['@string'] = { link = 'String' },
    ['@string.documentation'] = { link = 'String' },
    ['@string.regexp'] = { link = 'String' },
    ['@string.escape'] = { link = 'String' },
    ['@string.special'] = { link = 'SpecialChar' },
    ['@string.special.symbol'] = { link = 'String' },
    ['@string.special.path'] = { link = 'SpecialChar' },
    ['@string.special.url'] = { fg = pal.blue, underline = true },

    ['@character'] = { link = 'Character' },
    ['@character.special'] = { link = 'SpecialChar' },

    ['@boolean'] = { link = 'Boolean' },
    ['@number'] = { link = 'Number' },
    ['@number.float'] = { link = 'Float' },

    -- Types ---------------------------------------------------------------------------------------
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    ['@type.definition'] = { link = 'Type' },

    ['@attribute'] = { fg = pal.purple },
    ['@attribute.builtin'] = { link = 'SpecialChar' },
    ['@property'] = { link = 'Identifier' },

    -- Functions -----------------------------------------------------------------------------------
    ['@function'] = { link = 'Function' },
    ['@function.builtin'] = { link = 'Function' },
    ['@function.call'] = { link = 'Function' },
    ['@function.macro'] = { link = 'Function' },
    ['@function.method'] = { link = 'Function' },
    ['@function.method.call'] = { link = 'Function' },

    ['@constructor'] = { link = 'Function' },
    ['@operator'] = { link = 'Operator' },

    -- Keywords ------------------------------------------------------------------------------------
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.coroutine'] = { link = 'Keyword' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.operator'] = { link = 'Operator' },
    ['@keyword.import'] = { link = 'Keyword' },
    ['@keyword.type'] = { link = 'Typedef' },
    ['@keyword.modifier'] = { link = 'Operator' },
    ['@keyword.repeat'] = { link = 'Repeat' },
    ['@keyword.return'] = { link = 'Keyword' },
    ['@keyword.debug'] = { link = 'Debug' },
    ['@keyword.exception'] = { link = 'Keyword' },

    ['@keyword.conditional'] = { link = 'Conditional' },
    ['@keyword.conditional.ternary'] = { link = 'Conditional' },

    ['@keyword.directive'] = { link = 'PreProc' },
    ['@keyword.directive.define'] = { link = 'PreProc' },

    -- Punctuation ---------------------------------------------------------------------------------
    ['@punctuation.delimiter'] = { fg = pal.grey1 },
    ['@punctuation.bracket'] = { link = 'Delimiter' },
    ['@punctuation.special'] = { fg = pal.blue },

    -- Comments ------------------------------------------------------------------------------------
    ['@comment'] = { link = 'Comment' },
    ['@comment.documentation'] = { link = 'Comment' },

    ['@comment.error'] = { fg = pal.bg0, bg = pal.red },
    ['@comment.warning'] = { fg = pal.bg0, bg = pal.yellow },
    ['@comment.todo'] = { fg = pal.bg0, bg = pal.blue },
    ['@comment.note'] = { fg = pal.bg0, bg = pal.green },

    -- Markup --------------------------------------------------------------------------------------
    ['@markup.strong'] = { bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.strikethrough'] = { strikethrough = true },
    ['@markup.underline'] = { underline = true },

    ['@markup.heading'] = { link = 'Title' },
    ['@markup.heading.1'] = { fg = pal.red, bold = true },
    ['@markup.heading.2'] = { fg = pal.orange, bold = true },
    ['@markup.heading.3'] = { fg = pal.yellow, bold = true },
    ['@markup.heading.4'] = { fg = pal.blue, bold = true },
    ['@markup.heading.5'] = { fg = pal.green, bold = true },
    ['@markup.heading.6'] = { fg = pal.purple, bold = true },

    ['@markup.quote'] = { fg = pal.bg1 },
    ['@markup.math'] = { fg = pal.blue },

    ['@markup.link'] = { link = 'Constant' },
    ['@markup.link.label'] = { link = 'SpecialChar' },
    ['@markup.link.url'] = { fg = pal.blue, underline = true },

    ['@markup.raw'] = { link = 'String' },
    ['@markup.raw.block'] = { link = 'String' },

    ['@markup.list'] = { fg = pal.blue },
    ['@markup.list.checked'] = { fg = pal.green },
    ['@markup.list.unchecked'] = { fg = pal.grey1 },

    ['@diff.plus'] = { link = 'Added' },
    ['@diff.minus'] = { link = 'Removed' },
    ['@diff.delta'] = { link = 'Changed' },

    ['@tag'] = { fg = pal.orange },
    ['@tag.builtin'] = { link = 'Special' },
    ['@tag.attribute'] = { fg = pal.green },
    ['@tag.delimiter'] = { fg = pal.green },

    -- Language specific ---------------------------------------------------------------------------
    ['@constructor.lua'] = { fg = syn.delim },
  }
end

return M
