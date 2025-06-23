local icon = require('utils.icons').markdown

local plugin = {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown' },
  dependencies = {
    'echasnovski/mini.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}

plugin.opts = {
  enabled = true,
  render_modes = true,

  bullet = {
    icons = { icon.b1, icon.b2, icon.b3, icon.b4 },
  },

  checkbox = {
    checked = { icon = icon.box.checked },
    unchecked = { icon = icon.box.unchecked },
  },

  heading = {
    backgrounds = false,
    icons = { icon.h1, icon.h2, icon.h3, icon.h4, icon.h5, icon.h6 },
    position = 'inline',
    signs = false,
  },
}

return plugin
