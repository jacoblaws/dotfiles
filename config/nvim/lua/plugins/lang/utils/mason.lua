-- mason
--
-- manages external editor tooling such as LSP servers,
-- DAP servers, linters, and formatters through a single interface

local opts = {}

local config = function(_, opts)
  require('mason').setup(opts)
end

local plugin_spec = {
  'williamboman/mason.nvim',

  lazy = false,

  opts = opts,
  config = config,
}
return plugin_spec
