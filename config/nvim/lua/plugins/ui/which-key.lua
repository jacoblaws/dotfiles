-- which-key
--
-- displays a popup with possible keybindings 
-- of the command you started typing

local icon = require('core.utils.icons')

local opts = {
  defaults = {
    mode = { 'n', 'v', },

    ['<leader>f'] = { name = icon.telescope .. ' Find' },
    ['<leader>t'] = { name = icon.terminal  .. ' Terminal' },
    ['<leader>g'] = { name = icon.git       .. ' Git' },
    ['<leader>u'] = { name = icon.ui        .. ' UI' },
  },

  key_labels = {
    ['<space>'] = 'SPC',
    ['<cr>']    = 'RET',
    ['<tab>']   = 'TAB',
    ['<esc>']   = 'ESC',
    ['<bs>']    = 'BKSPC',
  },

  icons = {
    breadcrumb = icon.whichkey_breadcrumb,
    separator  = icon.whichkey_separator,
    group      = '',
  },

  window = {
    border = 'none',
    position = 'bottom',
  },

  layout = {
    align = 'center',
  },
}

local keys = { '<leader>', '"', "'", 'c', 'v' }

local config = function(_, opts)
  require('which-key').setup(opts)
  require('which-key').register(opts.defaults)
end

local plugin_spec = {
  'folke/which-key.nvim',

  lazy = true,
  event = 'VeryLazy',

  keys = keys,
  opts = opts,
  config = config,
}
return plugin_spec
