-- nvim-lspconfig
--
-- lsp configs for the neovim lsp client

local plugin = {
  'neovim/nvim-lspconfig',

  cmd = { 'LspInfo', 'LspInstall' },
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  dependencies = {
    'saghen/blink.cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
}

plugin.config = function()
  local lspconfig = require('lspconfig')
  local servers = { 'clangd', 'cmake', 'lua_ls', 'bashls', 'ts_ls', 'nil_ls' }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{ capabilities = require('blink.cmp').get_lsp_capabilities() }
  end
end

return plugin
