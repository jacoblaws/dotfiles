local M = {}

-- stylua: ignore start

M.modes = {
  ['n']     = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['no']    = { text = 'O-PENDING', hl = 'StatusLineNormal' },
  ['nov']   = { text = 'O-PENDING', hl = 'StatusLineNormal' },
  ['noV']   = { text = 'O-PENDING', hl = 'StatusLineNormal' },
  ['no\22'] = { text = 'O-PENDING', hl = 'StatusLineNormal' },
  ['niI']   = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['niR']   = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['niV']   = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['nt']    = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['ntT']   = { text = 'NORMAL',    hl = 'StatusLineNormal' },
  ['v']     = { text = 'VISUAL',    hl = 'StatusLineVisual' },
  ['vs']    = { text = 'VISUAL',    hl = 'StatusLineVisual' },
  ['V']     = { text = 'V-LINE',    hl = 'StatusLineVisual' },
  ['Vs']    = { text = 'V-LINE',    hl = 'StatusLineVisual' },
  ['\22']   = { text = 'V-BLOCK',   hl = 'StatusLineVisual' },
  ['\22s']  = { text = 'V-BLOCK',   hl = 'StatusLineVisual' },
  ['s']     = { text = 'SELECT',    hl = 'StatusLineVisual' },
  ['S']     = { text = 'S-LINE',    hl = 'StatusLineVisual' },
  ['\19']   = { text = 'S-BLOCK',   hl = 'StatusLineVisual' },
  ['i']     = { text = 'INSERT',    hl = 'StatusLineInsert' },
  ['ic']    = { text = 'INSERT',    hl = 'StatusLineInsert' },
  ['ix']    = { text = 'INSERT',    hl = 'StatusLineInsert' },
  ['R']     = { text = 'REPLACE',   hl = 'StatusLineReplace' },
  ['Rc']    = { text = 'REPLACE',   hl = 'StatusLineReplace' },
  ['Rx']    = { text = 'REPLACE',   hl = 'StatusLineReplace' },
  ['Rv']    = { text = 'V-REPLACE', hl = 'StatusLineReplace' },
  ['Rvc']   = { text = 'V-REPLACE', hl = 'StatusLineReplace' },
  ['Rvx']   = { text = 'V-REPLACE', hl = 'StatusLineReplace' },
  ['c']     = { text = 'COMMAND',   hl = 'StatusLineCommand' },
  ['cv']    = { text = 'EX',        hl = 'StatusLineCommand' },
  ['ce']    = { text = 'EX',        hl = 'StatusLineCommand' },
  ['r']     = { text = 'PROMPT',    hl = 'StatusLineOther' },
  ['rm']    = { text = 'MORE',      hl = 'StatusLineOther' },
  ['r?']    = { text = 'CONFIRM',   hl = 'StatusLineOther' },
  ['!']     = { text = 'SHELL',     hl = 'StatusLineOther' },
  ['t']     = { text = 'TERMINAL',  hl = 'StatusLineOther' },
}

-- stylua: ignore end

return M
