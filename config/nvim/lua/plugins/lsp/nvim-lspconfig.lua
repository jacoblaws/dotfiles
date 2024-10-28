-- nvim-lspconfig
--
-- lsp configs for the neovim lsp client

local plugin = {
  'neovim/nvim-lspconfig',

  cmd = { 'LspInfo', 'LspInstall' },
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'L3MON4D3/LuaSnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
}

plugin.config = function()
  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers = { 'clangd', 'cmake', 'lua_ls', 'bash_ls', 'ts_ls' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup { capabilities = capabilities }
  end
end

return plugin
