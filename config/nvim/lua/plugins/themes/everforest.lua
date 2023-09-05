-- everforest
--
-- a green-based color scheme; designed to be warm and soft

local opts = {
  background = 'medium',
  ui_contrast = 'low',

  italics = false,
  disable_italic_comments = false,

  show_eob = false,
}

local config = function(_, opts)
  require('everforest').setup(opts)
  vim.cmd[[ colorscheme everforest ]]
end

local plugin_spec = {
  'neanias/everforest-nvim',

  lazy = false,
  version = false,
  priority = 1000,

  opts = opts,
  config = config,
}
return plugin_spec
