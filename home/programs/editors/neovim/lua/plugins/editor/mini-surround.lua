local plugin = {
  'echasnovski/mini.surround',
  version = false,
  event = 'VeryLazy',
}

plugin.opts = {
  mappings = {
    add = 'gsa', -- add surrounding in Normal and Visual modes
    delete = 'gsd', -- delete surrounding
    find = 'gsf', -- find surrounding (to the right)
    find_left = 'gsF', -- find surrounding (to the left)
    highlight = 'gsh', -- highlight surrounding
    replace = 'gsr', -- replace surrounding
    upate_n_lines = 'gsn', -- update 'n_lines'
  },
}

plugin.config = function(_, opts)
  require('mini.surround').setup(opts)
end

return plugin
