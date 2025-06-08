local icon = require('utils.icons')

-- enable configured lsp
local lsp_configs = {}
for _, file in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local server_name = vim.fn.fnamemodify(file, ':t:r')
  table.insert(lsp_configs, server_name)
end
vim.lsp.enable(lsp_configs)

vim.diagnostic.config({
  jump = { float = true },
  severity_sort = true,
  update_in_insert = false,

  -- diagnostic handlers
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  signs = function()
    local signs = {
      [vim.diagnostic.severity.ERROR] = icon.diagnostics.error,
      [vim.diagnostic.severity.WARN] = icon.diagnostics.warn,
      [vim.diagnostic.severity.HINT] = icon.diagnostics.hint,
      [vim.diagnostic.severity.INFO] = icon.diagnostics.info,
    }
    for severity, sign in pairs(signs) do
      local name = vim.diagnostic.severity[severity]:lower():gsub('^%l', string.upper)
      name = 'DiagnosticSign' .. name
      vim.fn.sign_define(name, { text = sign, texthl = name, numhl = '' })
    end
    return signs
  end
})
