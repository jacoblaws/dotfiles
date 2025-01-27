-- which-key
--
-- displays a popup with possible keybindings 
-- of the command you started typing

local icon = require('utils.icons')

local plugin = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}

plugin.opts = {
  preset = 'modern',
  show_keys = true,
  show_help = true,

  spec = {
    mode = { 'n', 'v' },
    { '<leader>b',  group = icon.whichkey.buffer .. ' Buffer' },
    { '<leader>c',  group = icon.whichkey.code .. ' Code' },
    { '<leader>x',  group = icon.whichkey.diagnostics .. ' Diagnostics' },
    { '<leader>f',  group = icon.whichkey.find .. ' Find' },
    { '<leader>g',  group = icon.whichkey.git .. ' Git' },
    { '<leader>s',  group = icon.whichkey.search .. ' Search' },
    { '<leader>t',  group = icon.whichkey.terminal .. ' Terminal' },
    { '<leader>u',  group = icon.whichkey.ui .. ' UI' },
    {
      '<leader>w',
      group = icon.whichkey.windows .. ' Windows',
      proxy = '<c-w>',
      expand = function()
        return require('which-key.extras').expand.win()
      end,
    },
  },

  icons = {
    mappings = false,

    ellipsis = icon.ui.ellipsis,
    breadcrumb = icon.ui.chevron.double.right,
    separator  = icon.ui.arrow.right,
    group      = '',

    keys = {
      up = icon.ui.arrow.up,
      down = icon.ui.arrow.down,
      left = icon.ui.arrow.left,
      right = icon.ui.arrow.right,
      C = icon.key.ctrl,
      M = icon.key.option,
      D = icon.key.command,
      S = icon.key.shift,
      CR = icon.key.enter,
      Esc = icon.key.esc,
      ScrollWheelUp = icon.mouse.scroll.up,
      ScrollWheelDown = icon.mouse.scroll.down,
      NL = icon.key.enter,
      BS = icon.key.backspace,
      Space = icon.space,
      tab = icon.tab,
      F1 = icon.key.f1,
      F2 = icon.key.f2,
      F3 = icon.key.f3,
      F4 = icon.key.f4,
      F5 = icon.key.f5,
      F6 = icon.key.f6,
      F7 = icon.key.f7,
      F8 = icon.key.f8,
      F9 = icon.key.f9,
      F11 = icon.key.f11,
      F12 = icon.key.f12,
    },
  },
}

return plugin
