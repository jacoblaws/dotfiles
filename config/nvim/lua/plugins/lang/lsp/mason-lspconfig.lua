-- mason-lspconfig
--
-- bridges mason.nvim with the nvim-lspconfig plugin

local opts = {
  automatic_installation = true,
}

local config = function(_, opts)
  require('mason-lspconfig').setup(opts)
end

local plugin_spec = {
  'williamboman/mason-lspconfig.nvim',

  lazy = true,

  opts = opts,
  config = config,
}
return plugin_spec
