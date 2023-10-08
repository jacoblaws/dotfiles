-- nvim-lspconfig
--
-- lsp configs for the neovim lsp client

local opts = {}

local config = function(_, opts)
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers = { 'lua_ls', 'bashls', }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup { capabilities = capabilities }
  end
end

local dependencies = {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'folke/neodev.nvim',
}

local plugin_spec = {
  'neovim/nvim-lspconfig',

  lazy = true,
  cmd = { 'BufReadPre', 'BufNewFile' },

  opts = opts,
  config = config,
  dependencies = dependencies,
}
return plugin_spec
