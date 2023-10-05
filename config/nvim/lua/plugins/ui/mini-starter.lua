-- mini.starter
--
-- displays a start screen dashboard when entering neovim
-- without a pre-selected buffer

local opts = function()
  local starter = require('mini.starter')

  return {
    silent = false,
    autoopen = true,
    evaluate_single = false,

    header = [[
█████   █████ ███████████  ███████  █████   █████ █████ ██████  ██████
 █████   ███   ███     █ ██   ██  ███     ███   ███   ██████████
 █████  ███   ███       ██     ██ ███     ███   ███   ███ ████ ███
 ███ ██ ███   ███████▶  ███       ███ ██   ██   ███   ███  ██  ███
 ███  █████   ███       ██     ██  ██ ██    ███   ███        ███
 ███   █████   ███     █ ██   ██    █████     ███   ███        ███
███   ████  ██████████  ███████      ███     ███ ███      ███
    ]],
  }
end

local config = function(_, opts)
  require('mini.starter').setup(opts)
end

local plugin_spec = {
  'echasnovski/mini.starter',

  lazy = true,
  event = 'VimEnter',
  version = false,

  opts = opts,
  config = config,
}
return plugin_spec
