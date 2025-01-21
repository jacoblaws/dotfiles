-- snacks.dashboard
--
-- displays a start-screen dashboard when
-- opening neovim without a file-name arugment

local icon = require('utils.icons')

local plugin = {
  'snacks.nvim',
}

plugin.opts = {
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = icon.file.default, key = 'n', desc = 'New File', action = ':ene | startinsert' },
        { icon = icon.dashboard.find, key = 'f', desc = 'Find File', action = ':lua Snacks.dashboard.pick("files")'},
        { icon = icon.dashboard.recent, key = 'r', desc = 'Recent Files', action = ':lua Snacks.dashboard.pick("oldfiles")' },
        { icon = icon.dashboard.text, key = 'g', desc = 'Find Text', action = ':lua Snacks.dashboard.pick("live_grep")' },
        { icon = icon.dashboard.plugins, key = 'p', desc = 'Plugins', action = ':Lazy' },
        { icon = icon.dashboard.quit, key = 'q', desc = 'Quit', action = ':qa' },
      },
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
      { section = 'startup', icon = '' },
    },
  },
}

return plugin
