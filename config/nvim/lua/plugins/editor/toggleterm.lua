-- toggleterm
--
-- toggle and persist multiple terminals during an editing session

local opts = {
  direction = 'float',
  float_opts = {
    border = 'curved',
  }
}

local config = function(_, opts)
  require('toggleterm').setup(opts)
end

local init = function()
  require('core.utils').load_keymaps('toggleterm')
end

local plugin_spec = {
  'akinsho/toggleterm.nvim',

  lazy = true,
  version = '*',

  cmd = { 'ToggleTerm', 'TermExec' },

  init = init,
  opts = opts,
  config = config,
}
return plugin_spec
