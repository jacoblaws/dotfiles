-- dashboard-nvim
--
-- displays a start screen dashboard when opening
-- neovim without a filename argument

local header = [[
█████   █████ █████   █████ █████ ██████  ██████
 █████   ███   ███     ███   ███   ██████████ 
 █████  ███   ███     ███   ███   ███ ████ ███ 
 ███ ██ ███   ██   ██   ███   ███  ██  ███ 
 ███  █████    ██ ██    ███   ███        ███ 
 ███   █████     █████     ███   ███        ███ 
███   ████      ███     ███ ███      ███
]]
header = string.rep('\n', 8) .. header .. '\n'

local plugin = {
  'nvimdev/dashboard-nvim',

  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

plugin.opts = function()
  local icon = require('core.utils.icons')

  local center = {
    { action = 'ene | startinsert',    desc = ' New file',     icon = icon.file_new    .. ' ', key = 'n' },
    { action = 'Telescope find_files', desc = ' Find files',   icon = icon.search      .. ' ', key = 'f' },
    { action = 'Telescope oldfiles',   desc = ' Recent Files', icon = icon.file_recent .. ' ', key = 'r' },
    { action = 'Telescope live_grep',  desc = ' Find text',    icon = icon.grep        .. ' ', key = 'g' },
    { action = 'Lazy',                 desc = ' Plugins',      icon = icon.plugins     .. ' ', key = 'p' },
    { action = 'qa',                   desc = ' Quit',         icon = icon.quit        .. ' ', key = 'q' },
  }

  for _, button in ipairs(center) do
    button.desc = button.desc .. string.rep(" ", 32 - #button.desc)
    button.key_format = "  %s"
  end

  return {
    theme = 'doom',
    disable_move = true,
    hide = { statusline = false },

    config = {
      header = vim.split(header, '\n'),
      packages = { enable = false },

      center = center,

      footer = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        return { 'Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
      end,
    },
  }
end

plugin.config = function(_, opts)
  require('dashboard').setup(opts)
end

return plugin
