-- toggleterm
--
-- toggle and persist multiple terminals during an editing session

local plugin = {
  'akinsho/toggleterm.nvim',

  cmd = { 'ToggleTerm', 'TermExec' },
  version = '*',
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

plugin.init = function()
  require('core.utils').load_keymaps('toggleterm')
end

return plugin
