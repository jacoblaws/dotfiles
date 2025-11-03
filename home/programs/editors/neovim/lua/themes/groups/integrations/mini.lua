local M = {}

-- stylua: ignore start

function M.get(spec)
  local syn = spec.syntax
  return {
    MiniJump2dSpotAhead  = { fg = syn.string },
    MiniJump2dSpot       = { fg = syn.operator, bold = true },
    MiniJump2dDim        = { link = 'Comment' },
    MiniJump             = { link = 'SpellRare' },
    MiniJump2dSpotUnique = { link = 'MiniJump2dSpot' },
  }
end

-- stylua: ignore end

return M
