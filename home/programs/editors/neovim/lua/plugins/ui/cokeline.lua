-- cokeline
--
-- a highly customizable bufferline plugin

local buf = require('utils.buffer')

local plugin = {
  'willothy/nvim-cokeline',

  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
}

plugin.keys = {
  { '<tab>', buf.cycle_next, desc = 'Cycle to next buffer' },
  { '<S-tab>', buf.cycle_prev, desc = 'Cycle to previous buffer' },
}

plugin.opts = function()
  local icon = require('utils.icons')
  local get_hl_attr = require('cokeline.hlgroups').get_hl_attr
  return {
    show_if_buffers_are_at_least = 1,

    fill_hl = 'CokeLineFill',
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused
          and get_hl_attr('CokeLineBufferActive', 'fg')
           or get_hl_attr('CokeLineBufferInactive', 'fg')
      end,

      bg = function(buffer)
        return buffer.is_focused
          and get_hl_attr('CokeLineBufferActive', 'bg')
           or get_hl_attr('CokeLineBufferInactive', 'bg')
      end,
    },

    sidebar = {
      filetype = 'neo-tree',
      components = {
        {
          text = ' ' .. icon.buffer.explorer .. ' File Explorer',
          fg = get_hl_attr('Directory', 'fg'),
          bg = get_hl_attr('WinSeparator', 'fg'),
          style = 'bold',
        },
      },
    },

    components = {
      {
        text = function(buffer)
          local neo_tree_open = require('utils.ui').neo_tree_open()
          return (buffer.index == 1 and neo_tree_open) and '▋' or ''
        end,
        fg = get_hl_attr('WinSeparator', 'fg'),
      },
      {
        text = function(buffer) return ' ' .. buffer.devicon.icon end,
      },
      {
        text = function(buffer) return buffer.unique_prefix end,
      },
      {
        text = function(buffer) return buffer.filename .. ' ' end,
      },
      {
        text = function(buffer)
          if buffer.is_readonly then return icon.buffer.readonly end
          if buffer.is_modified then return icon.buffer.modified end
          return icon.buffer.close
        end,
        delete_buffer_on_left_click = true,
      },
      {
        text = ' ',
      },
    },
  }
end

plugin.config = function(_, opts)
  require('cokeline').setup(opts)
end

return plugin
