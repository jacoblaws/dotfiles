-- lspkind
--
-- adds vscode-like icons to neovim built-in lsp

local opts = {
  mode   = "symbol_text",
  preset = "default",
}

local config = function(_, opts)
  require('lspkind').init(opts)
end

local plugin_spec = {
  'onsails/lspkind.nvim',

  lazy = true,
  config = config,
}
return plugin_spec
