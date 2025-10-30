vim.pack.add({
  -- Dependencies
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },

  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/A7Lavinraj/fyler.nvim', version = 'stable' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('3') },
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
