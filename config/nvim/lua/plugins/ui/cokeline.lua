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

    components = {
      {
        text = function(buffer)
          local get_state = require('neo-tree.sources.manager').get_state
          local renderer = require('neo-tree.ui.renderer')

          local file_open = renderer.window_exists(get_state('filesystem'))
          local buf_open = renderer.window_exists(get_state('buffers'))
          local git_open = renderer.window_exists(get_state('git_status'))

          local neotree_open = file_open or buf_open or git_open

          if buffer.index == 1 and neotree_open then return ' ' end
          return '' 
        end,
      },
      {
        text = function(buffer) return (buffer.index ~= 1) and icon.win_separator or ' ' end,
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
          if buffer.is_readonly then return icon.file_readonly end
          if buffer.is_modified then return icon.file_modified end
          return icon.buffer_close
        end,
        delete_buffer_on_left_click = true,
      },
      {
        text = '  ',
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
