vim.pack.add({
  -- Dependencies
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },

  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/A7Lavinraj/fyler.nvim', version = 'stable' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('3') },
  { src = 'https://github.com/willothy/nvim-cokeline' },
})

require('which-key').setup({
  preset = 'helix',
  icons = {
    group = '',
    mappings = false,
  },
})

require('which-key').add({
  { '<leader>b', group = '󰌨 Buffer' },
  { '<leader>f', group = '󰍉 Find' },
  { '<leader>g', group = '󰊢 Git' },
  { '<leader>l', group = '󰅴 Language' },
  { '<leader>t', group = '󰔡 Toggle' },
})

require('fyler').setup({
  confirm_simple = true,
  default_explorer = true,
  win = {
    border = 'rounded',
    kind = 'float',
  },
})

require('neo-tree').setup({
  popup_border_style = '',

  default_component_configs = {
    indent = {
      with_expanders = true,
      last_indent_marker = '╰',
    },

    git_status = {
      symbols = _G.Config.icons.status,
    },

    icon = {
      default = '*',
      folder_open = '󰝰 ',
      folder_closed = '󰉋 ',
      folder_empty = '󰉖 ',
      folder_empty_open = '󰷏 ',
      use_filtered_colors = true,
    },
  },

  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    components = {
      name = function(config, node, state)
        local text, hl
        local highlights = require('neo-tree.ui.highlights')

        if node.type == 'directory' then hl = highlights.DIRECTORY_NAME end
        if node:get_depth() == 1 then
          hl = highlights.ROOT_NAME
          text = vim.fs.basename(vim.loop.cwd() or '')
        else
          text = node.name
          if config.use_git_status_colors == nil or config.use_git_status_colors then
            local git_status = state.components.git_status({}, node, state)
            if git_status and git_status.highlight then hl = git_status.highlight end
          end
        end

        return { text = text, highlight = hl }
      end,
    },
  },

  window = {
    mappings = {
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['P'] = 'toggle_preview',
    },
  },
})

require('cokeline').setup({
  show_if_buffers_are_at_least = 1,

  fill_hl = 'TabLine',
  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and vim.api.nvim_get_hl(0, { name = 'Normal' }).fg
        or vim.api.nvim_get_hl(0, { name = 'TabLine' }).fg
    end,
    bg = function(buffer)
      return buffer.is_focused and vim.api.nvim_get_hl(0, { name = 'Normal' }).bg
        or vim.api.nvim_get_hl(0, { name = 'TabLine' }).bg
    end,
  },

  sidebar = {
    filetype = 'neo-tree',
    components = {
      {
        text = '󰐅 File Tree',
        fg = 'Function',
        bg = 'TabLine',
        style = 'bold',
      },
    },
  },

  components = {
    {
      text = function(buffer)
        local function is_neotree_open()
          if not package.loaded['neo-tree'] then return nil end

          local get_state = require('neo-tree.sources.manager').get_state
          local renderer = require('neo-tree.ui.renderer')

          local file_open = renderer.window_exists(get_state('filesystem'))
          local buf_open = renderer.window_exists(get_state('buffers'))
          local git_open = renderer.window_exists(get_state('git_status'))

          return file_open or buf_open or git_open
        end

        local neotree_state = is_neotree_open()
        return (buffer.index == 1 and neotree_state) and '▋' or ''
      end,
      fg = 'WinSeparator',
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
        if buffer.is_readonly then return '' end
        if buffer.is_modified then return '' end
        return ''
      end,
      delete_buffer_on_left_click = true,
    },
    {
      text = ' ',
    },
  },
})
