-- which-key
--
-- displays a popup with possible keybindings 
-- of the command you started typing

local opts = {
  defaults = {
    mode = { 'n', 'v', },
  },

  key_labels = {
    ['<space>'] = 'SPC',
    ['<cr>']    = 'RET',
    ['<tab>']   = 'TAB',
    ['<esc>']   = 'ESC',
    ['<bs>']    = 'BKSPC',
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
end

local plugin_spec = {
  'folke/which-key.nvim',

  lazy = true,
  keys = keys,

  opts = opts,
  config = configs,
}
return plugin_spec
