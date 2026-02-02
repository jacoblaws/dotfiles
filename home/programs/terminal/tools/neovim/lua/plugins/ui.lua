vim.pack.add({
  -- Dependencies
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },

  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/A7Lavinraj/fyler.nvim', version = 'stable' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('3') },
  { src = 'https://github.com/willothy/nvim-cokeline' },
  { src = 'https://github.com/folke/noice.nvim' },
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
  { '<leader>n', group = '󰂚 Notifications' },
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
  hide_root_node = true,
  retain_hidden_root_indent = true,
  popup_border_style = '',

  default_component_configs = {
    indent = {
      padding = 0,
      with_expanders = true,
      last_indent_marker = '╰',
      expander_collapsed = '',
      expander_expanded = '',
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
        text = '󰝰 ' .. vim.fs.basename(vim.loop.cwd() or ''),
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

require('noice').setup({
  cmdline = {
    view = 'cmdline',
    format = {
      cmdline = { icon = '' },
      search_down = { icon = '󰍉 ' },
      search_up = { icon = '󰍉 ' },
      lua = { icon = '󰢱' },
      help = { icon = '?' },
      input = { icon = '󰌌' },
    },
  },

  lsp = {
    progress = { view = 'notify' },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },

  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },

  views = {
    notify = { backend = 'snacks', replace = true, merge = true },
  },
})
