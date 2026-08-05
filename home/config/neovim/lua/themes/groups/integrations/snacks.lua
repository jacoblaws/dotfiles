local M = {}

-- stylua: ignore start

function M.get(spec)
  local pal = spec.palette
  return {
    SnacksDashboardDesc         = { link = 'Special' },
    SnacksDashboardDir          = { link = 'NonText' },
    SnacksDashboardFile         = { link = 'Identifier' },
    SnacksDashboardFooter       = { link = 'Special' },
    SnacksDashboardHeader       = { link = 'Special' },
    SnacksDashboardIcon         = { link = 'Special' },
    SnacksDashboardKey          = { link = 'Title' },
    SnacksDashboardNormal       = { link = 'Identifier' },
    SnacksDashboardSpecial      = { link = 'Special' },
    SnacksDashboardTerminal     = { link = 'SnacksDashboardNormal' },
    SnacksDashboardTitle        = { link = 'Special' },
    SnacksIndent                = { fg = pal.bg2 },
    SnacksIndentScope           = { fg = pal.bg5 },
    SnacksPickerTitle           = { link = 'FloatTitle' },
    SnacksPickerCursorLine      = { link = 'CursorLine' },
    SnacksPickerListCursorLine  = { link = 'CursorLine' },
    SnacksPickerPrompt          = { link = 'Title' },
  }
end

-- stylua: ignore end

return M
