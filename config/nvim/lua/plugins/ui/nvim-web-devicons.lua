-- nvim-web-devicons
--
-- provides easy access to numerous icons in neovim

local icon = require('core.utils.icons')

local opts = {
  override_by_extension = {
    ['c']   = { icon = icon.c },
    ['cpp'] = { icon = icon.cpp },
    ['lua'] = { icon = icon.lua },
    ['rs']  = { icon = icon.rust },
    ['py']  = { icon = icon.python },
    ['hs']  = { icon = icon.haskell },
  },
}

local config = function(_, opts)
  require('nvim-web-devicons').setup(opts)
end
local plugin_spec = {
  'nvim-tree/nvim-web-devicons',

  lazy = true,

  opts = opts,
  config = config,
}
return plugin_spec
