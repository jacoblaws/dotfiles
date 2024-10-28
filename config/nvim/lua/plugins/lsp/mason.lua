-- mason
--
-- manages external editor tooling such as LSP servers,
-- DAP servers, linters, and formatters through a single interface

local plugin = {
  'williamboman/mason.nvim',
}

plugin.config = function()
  require('mason').setup()
end

return plugin
