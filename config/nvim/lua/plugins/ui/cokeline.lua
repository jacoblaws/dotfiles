-- cokeline
--
-- a highly customizable bufferline plugin

local opts = function()
  local icon = require('core.utils.icons')
  local get_hex = require('cokeline.utils').get_hex

  return {
    show_if_buffers_are_at_least = 1,

    sidebar = {
      filetype = 'neo-tree',
      components = {
        {
          text = ' ' .. icon.file_tree .. ' File Explorer',
          fg = get_hex('Directory', 'fg'),
          bg = get_hex('TabLineFill', 'bg'),
          style = 'bold',
        },
      },
    },
  }
end

local config = function(_, opts)
  require('cokeline').setup(opts)
end

local dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
}

local plugin_spec = {
  'willothy/nvim-cokeline',

  lazy = false,

  opts = opts,
  config = config,
  dependencies = dependencies,
}
return plugin_spec
