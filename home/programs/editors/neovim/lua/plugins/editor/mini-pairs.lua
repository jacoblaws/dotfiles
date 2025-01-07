local plugin = {
  'echasnovski/mini.pairs',

  event = 'VeryLazy',
  version = false,
}

plugin.opts = {
  modes = { insert = true, command = true, terminal = false, },
}

plugin.config = function(_, opts)
  require('mini.pairs').setup(opts)
end

return plugin
