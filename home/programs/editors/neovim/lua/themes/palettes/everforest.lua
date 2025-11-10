local M = {}

-- stylua: ignore start

local palette = {
  dark = {
    red    = '#e67e80',
    yellow = '#dbbc7f',
    green  = '#a7c080',
    blue   = '#7fbbb3',
    purple = '#d699b6',
    aqua   = '#83c092',
    orange = '#e69875',

    grey0  = '#7a8478',
    grey1  = '#859289',
    grey2  = '#9da9a0',

    fg     = '#d3c6aa',
    bgd    = '#232a2e',
    bg0    = '#2d353b',
    bg1    = '#343f44',
    bg2    = '#3d484d',
    bg3    = '#475258',
    bg4    = '#4f585e',
    bg5    = '#56635f',

    bgr    = '#514045',
    bgy    = '#4d4c43',
    bgg    = '#425047',
    bgb    = '#3a515d',
    bgp    = '#4a444e',
    bgv    = '#543a48',
  },

  light = {
    red    = '#f85552',
    yellow = '#dfa000',
    green  = '#8da101',
    blue   = '#3a94c5',
    purple = '#df69ba',
    aqua   = '#35a77c',
    orange = '#f57d26',

    grey0  = '#a6b0a0',
    grey1  = '#939f91',
    grey2  = '#829181',

    fg     = '#5c6a72',
    bgd    = '#efebd4',
    bg0    = '#fdf6e3',
    bg1    = '#f4f0d9',
    bg2    = '#efebd4',
    bg3    = '#e6e2cc',
    bg4    = '#e0dcc7',
    bg5    = '#bdc3af',

    bgr    = '#fde3da',
    bgy    = '#faedcd',
    bgg    = '#f0f1d2',
    bgb    = '#e9f0e9',
    bgp    = '#fae8e2',
    bgv    = '#eaedc8',
  },
}

function M.generate_spec(mode)
  local hl = require('themes').hl
  local pal = palette[mode]
  return {
    palette = pal,

    editor = {
      conceal    = hl(pal.fg),
      cursor     = hl(pal.bg0, pal.fg),
      cursorline = hl(nil, pal.bg1),
      directory  = hl(pal.green),
      winsep     = hl(pal.bgd),
      folded     = hl(pal.grey1, pal.bg1),
      foldcol    = hl(pal.bg5),
      search     = hl(pal.bg0, pal.green),
      incsearch  = hl(pal.bg0, pal.red),
      substitute = hl(pal.bg0, pal.yellow),
      linenr     = hl(pal.bg5),
      matchparen = hl(pal.purple, nil, 'bold'),
      nontext    = hl(pal.bg3, nil),
      normal     = hl(pal.fg, pal.bg0),
      border     = hl(pal.grey1),
      pmenu      = hl(pal.fg, pal.bg0),
      pmenusel   = hl(pal.yellow, pal.bg1),
      pmenuthumb = hl(nil, pal.grey0),
      question   = hl(pal.yellow),
      quickfix   = hl(pal.purple, nil, 'bold'),
      special    = hl(pal.yellow),
      statusline = hl(pal.grey0, pal.bgd),
      tabline    = hl(pal.grey1, pal.bgd),
      title      = hl(pal.orange, nil, 'bold'),
      winbar     = hl(pal.grey1, pal.bgd),
    },

    syntax = {
      comment   = pal.grey1,
      const     = pal.aqua,
      string    = pal.aqua,
      number    = pal.purple,
      ident     = pal.blue,
      fun       = pal.green,
      statement = pal.red,
      operator  = pal.orange,
      keyword   = pal.red,
      macro     = pal.aqua,
      preproc   = pal.purple,
      type      = pal.yellow,
      special   = pal.yellow,
      label     = pal.orange,
      delim     = pal.fg
    },

    statusline = {
      normal = hl(pal.bgd, pal.green),
      visual = hl(pal.bgd, pal.red),
      insert = hl(pal.bgd, pal.yellow),
      replace = hl(pal.bgd, pal.orange),
      command = hl(pal.bgd, pal.blue),
      other = hl(pal.bgd, pal.purple),
    },

    diagnostics = {
      error = pal.red,
      warn  = pal.yellow,
      info  = pal.blue,
      hint  = pal.purple,
      ok    = pal.aqua,
    },

    git = {
      added   = pal.green,
      removed = pal.red,
      changed = pal.blue,
    },

    diff = {
      add   = pal.bgg,
      change = pal.bgb,
      delete = pal.bgr,
      text    = pal.bg1,
    },
  }
end

-- stylua: ignore end

return M
