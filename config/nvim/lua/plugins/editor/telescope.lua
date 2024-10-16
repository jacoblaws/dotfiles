-- telescope
--
-- highly extendable fuzzy finder

local plugin = {
  'nvim-telescope/telescope.nvim',

  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}

plugin.config = function(_, opts)
  require('telescope').setup(opts)
end

plugin.init = function()
  require('core.utils').load_keymaps('find')
  require('core.utils').load_keymaps('git')
end

return plugin
