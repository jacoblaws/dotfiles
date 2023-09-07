-- telescope
--
-- highly extendable fuzzy finder

local opts = {}

local config = function(_, opts)
  require('telescope').setup(opts)
end

local dependencies = {
  'nvim-lua/plenary.nvim',
}

local plugin_spec = {
  'nvim-telescope/telescope.nvim',

  cmd = 'Telescope',
  lazy = true,

  opts = opts,
  config = config,
  dependencies = dependencies,
}
return plugin_spec
