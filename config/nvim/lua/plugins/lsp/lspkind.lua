-- lspkind
--
-- adds vscode-like icons to neovim built-in lsp

local plugin = {
  'onsails/lspkind.nvim',
}

plugin.opts = {
  mode = "symbol_text",
  preset = "default",
}

plugin.config = function(_, opts)
  require('lspkind').init(opts)
end

return plugin
