local plugin = {
  'echasnovski/mini.nvim',
  lazy = false,
  version = false,
}

plugin.config = function()
  local opts = 'plugins.bundle.mini'

  require('mini.pairs').setup(require(opts .. '.pairs'))
  require('mini.surround').setup(require(opts .. '.surround'))
end

return plugin
