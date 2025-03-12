-- nvim-lspconfig
--
-- lsp configs for the neovim lsp client

local icon = require('utils.icons')

local plugin = {
  'neovim/nvim-lspconfig',

  cmd = { 'LspInfo', 'LspInstall' },
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  dependencies = {
    'saghen/blink.cmp',
  },
}

plugin.keys = {
  { 'gd', vim.lsp.buf.definition, desc = 'Goto definition' },
  { 'gr', vim.lsp.buf.references, desc = 'List references' },
  { 'gI', vim.lsp.buf.implementation, desc = 'Goto implementation' },
  { 'gy', vim.lsp.buf.type_definition, desc = 'Goto type definition' },
  { 'gD', vim.lsp.buf.declaration, desc = 'Goto declaration' },
  { 'K', function() return vim.lsp.buf.hover() end, desc = 'Hover' },
  { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code action', mode = { 'n', 'v' } },
  { '<leader>cr', vim.lsp.buf.rename, desc = 'Rename' },
}

plugin.opts = {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    severity_sort = true,
    signs = {
      [vim.diagnostic.severity.ERROR] = icon.diagnostics.error,
      [vim.diagnostic.severity.WARN] = icon.diagnostics.warn,
      [vim.diagnostic.severity.HINT] = icon.diagnostics.hint,
      [vim.diagnostic.severity.INFO] = icon.diagnostics.info,
    },
  }
}

plugin.config = function(_, opts)
  -- diagnostic signs
  for severity, sign in pairs(opts.diagnostics.signs) do
    local name = vim.diagnostic.severity[severity]:lower():gsub('^%l', string.upper)
    name = 'DiagnosticSign' .. name
    vim.fn.sign_define(name, { text = sign, texthl = name, numhl = '' })
  end

  vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

  local lspconfig = require('lspconfig')
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  local servers = { 'clangd', 'cmake', 'lua_ls', 'bashls', 'ts_ls', 'nil_ls' }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup { capabilities = capabilities }
  end
end

return plugin
