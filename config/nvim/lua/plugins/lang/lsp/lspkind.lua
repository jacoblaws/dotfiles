-- lspkind
--
-- adds vscode-like icons to neovim built-in lsp

local init = function()
  require('lspkind').init({
    mode   = "symbol_text",
    preset = "default",
  })
end

local plugin_spec = {
  'onsails/lspkind.nvim',

  lazy = true,
  init = init,
}
return plugin_spec
