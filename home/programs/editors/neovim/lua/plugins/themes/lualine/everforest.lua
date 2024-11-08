-- lualine everforest theme

local palette = {
  red     = '#e67e80',
  green   = '#a7c080',
  blue    = '#7fbbb3',
  yellow  = '#dbbc7f',
  magenta = '#d699b6',
  cyan    = '#83c092',
  orange  = '#e69875',

  fg      = '#d3c6aa',
  fg_dim  = '#7a8478',
  bg_dim  = '#232a2e',
  bg0     = '#2d353b',
  bg1     = '#343f44',
  bg2     = '#3d484d',
  bg3     = '#475258',
  bg4     = '#4f585e',
  bg5     = '#56635f',

  grey0   = '#7a8478',
  grey1   = '#859289',
  grey2   = '#9da9a0',
}

local theme = {
  normal = {
    a = { fg = palette.bg_dim, bg = palette.green, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  insert = {
    a = { fg = palette.bg_dim, bg = palette.yellow, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  visual = {
    a = { fg = palette.bg_dim, bg = palette.red, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  replace = {
    a = { fg = palette.bg_dim, bg = palette.orange, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  command = {
    a = { fg = palette.bg_dim, bg = palette.blue, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  terminal = {
    a = { fg = palette.bg_dim, bg = palette.magenta, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },

  inactive = {
    a = { fg = palette.bg_dim, bg = palette.bg0, gui = 'bold' },
    b = { fg = palette.fg_dim, bg = palette.bg_dim },
    c = { fg = palette.fg_dim, bg = palette.bg_dim },
  },
}
return theme
