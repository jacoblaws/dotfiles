-- toggleterm
--
-- toggle and persist multiple terminals during an editing session

local plugin = {
  'akinsho/toggleterm.nvim',

  version = '*',
  cmd = { 'ToggleTerm', 'TermExec' },
}

plugin.keys = {
  { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Float' },
  { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Horizontal' },
  { '<leader>tt', '<cmd>ToggleTerm direction=tab<cr>', desc = 'Tab' },
  { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Vertical' },
}

plugin.opts = {
  shading_factor = 2,
  direction = 'float',
  float_opts = {
    border = 'curved',
  }
}

plugin.config = function(_, opts)
  require('toggleterm').setup(opts)
end

return plugin
