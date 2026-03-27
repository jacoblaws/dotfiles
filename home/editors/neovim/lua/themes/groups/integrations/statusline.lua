local M = {}

-- stylua: ignore start

function M.get(spec)
  local statusline = spec.statusline
  local invert_hl = require('themes').invert_hl
  return {
    StatusLineNormal     = statusline.normal,
    StatusLineInsert     = statusline.insert,
    StatusLineVisual     = statusline.visual,
    StatusLineReplace    = statusline.replace,
    StatusLineCommand    = statusline.command,
    StatusLineOther      = statusline.other,
    StatusLineNormalSep  = invert_hl(statusline.normal),
    StatusLineInsertSep  = invert_hl(statusline.insert),
    StatusLineVisualSep  = invert_hl(statusline.visual),
    StatusLineReplaceSep = invert_hl(statusline.replace),
    StatusLineCommandSep = invert_hl(statusline.command),
    StatusLineOtherSep   = invert_hl(statusline.other),
  }
end

-- stylua: ignore end

return M
