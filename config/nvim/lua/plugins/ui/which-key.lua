-- which-key
--
-- displays a popup with possible keybindings 
-- of the command you started typing

local icon = require('core.utils.icons')

local opts = {
  preset = 'classic',

  spec = {
    mode = { 'n', 'v' },
    {'<leader>f', group = icon.telescope .. ' Find' },
    {'<leader>t', group = icon.terminal  .. ' Terminal' },
    {'<leader>g', group = icon.git       .. ' Git' },
    {'<leader>u', group = icon.ui        .. ' UI' },
  },

  icons = {
    mappings = false,

    breadcrumb = icon.whichkey_breadcrumb,
    separator  = icon.whichkey_separator,
    group      = '',
  },

  show_keys = true,
  show_help = false,
}

return {
  'folke/which-key.nvim',

  lazy = true,
  event = 'VeryLazy',
  opts = opts,
}
