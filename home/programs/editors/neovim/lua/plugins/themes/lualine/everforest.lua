-- lualine everforest theme

local palettes = require('everforest.colours')
local config = require('everforest').config
local palette = palettes.generate_palette(config, vim.o.background)

return {
  normal = {
    a = { fg = palette.bg_dim, bg = palette.green, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  insert = {
    a = { fg = palette.bg_dim, bg = palette.yellow, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  visual = {
    a = { fg = palette.bg_dim, bg = palette.red, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  replace = {
    a = { fg = palette.bg_dim, bg = palette.orange, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  command = {
    a = { fg = palette.bg_dim, bg = palette.blue, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  terminal = {
    a = { fg = palette.bg_dim, bg = palette.purple, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },

  inactive = {
    a = { fg = palette.bg_dim, bg = palette.bg0, gui = 'bold' },
    b = { fg = palette.grey0, bg = palette.bg_dim },
    c = { fg = palette.grey0, bg = palette.bg_dim },
  },
}
