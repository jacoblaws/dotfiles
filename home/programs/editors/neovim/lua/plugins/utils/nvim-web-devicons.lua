-- nvim-web-devicons
--
-- provides easy access to numerous icons in neovim

local icon = require('core.utils.icons')

local plugin = {
  'nvim-tree/nvim-web-devicons',
}

plugin.opts = {
  override_by_extension = {
    ['c']   = { icon = icon.c },
    ['cpp'] = { icon = icon.cpp },
    ['lua'] = { icon = icon.lua },
    ['rs']  = { icon = icon.rust },
    ['py']  = { icon = icon.python },
    ['hs']  = { icon = icon.haskell },
  },
}

plugin.config = function(_, opts)
  require('nvim-web-devicons').setup(opts)
end

return plugin
