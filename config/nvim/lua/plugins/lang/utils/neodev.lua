-- neodev
--
-- neovim setup for init.lua and plugin development with
-- full signature help, docs, and completion from the nvim lua API

local opts = {}

local config = function(_, opts)
  require('neodev').setup(opts)
end

local plugin_spec = {
  'folke/neodev.nvim',

  lazy = true,

  opts = opts,
  config = config,
}
return plugin_spec
