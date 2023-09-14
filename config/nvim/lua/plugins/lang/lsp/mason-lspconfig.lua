-- mason-lspconfig
--
-- bridges mason.nvim with the nvim-lspconfig plugin

local opts = {
  ensure_installed = {
  },

  automatic_installation = false,
}

local config = function(_, opts)
  require('mason-lspconfig').setup(opts)
end

local plugin_spec = {
  'williamboman/mason-lspconfig.nvim',

  lazy = false,

  opts = opts,
  config = config,
}
return plugin_spec
