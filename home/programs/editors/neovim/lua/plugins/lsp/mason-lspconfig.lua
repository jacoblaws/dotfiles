-- mason-lspconfig
--
-- bridges mason.nvim with the nvim-lspconfig plugin

local plugin = {
  'williamboman/mason-lspconfig.nvim',
}

plugin.opts = {
  automatic_installation = true,
}

plugin.config = function(_, opts)
  require('mason-lspconfig').setup(opts)
end

return plugin
