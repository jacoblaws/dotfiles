-- neo-tree.nvim
--
-- for browsing the file system or other tree-like structures

local icon = require('utils.icons')

local plugin = {
  'nvim-neo-tree/neo-tree.nvim',

  cmd = 'Neotree',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}

plugin.keys = {
  { '<leader>e', '<cmd>Neotree toggle left<cr>', desc = 'File Explorer' },
  { '<leader>ge', '<cmd>Neotree toggle git_status<cr>', desc = 'Git Explorer' },
  { '<leader>be', '<cmd>Neotree toggle buffers<cr>', desc = 'Buffer Explorer'}
}

plugin.opts = {
  popup_border_style = 'rounded',

  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },

  window = {
    mappings = {
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['P'] = "toggle_preview",
    },
  },

  default_component_configs = {
    indent = {
      with_markers = true,
      indent_marker = icon.box.vertical.light,
      last_indent_marker = icon.box.corner.up_right.light,
      indent_size = 2,

      with_expanders = true,
      expander_collapsed = icon.expander.collapsed,
      expander_expanded = icon.expander.expanded,
      expander_highlight = 'NeoTreeExpander',
    },

    icon = {
      folder_closed = icon.folder.closed,
      folder_open = icon.folder.open,
      folder_empty = icon.folder.empty,
    },

    git_status = {
      symbols = {
        added = icon.git.added,
        deleted = icon.git.removed,
        modified = icon.git.modified,
        renamed = icon.git.renamed,
        untracked = icon.git.untracked,
        ignored = icon.git.ignored,
        unstaged = icon.git.unstaged,
        staged = icon.git.staged,
        conflict = icon.git.conflict,
      },
    },

    diagnostics = {
      symbols = {
        hint = icon.diagnostics.hint,
        info = icon.diagnostics.info,
        warn = icon.diagnostics.warn,
        error = icon.diagnostics.error,
      },
    },
  },
}

plugin.config = function(_, opts)
  require('neo-tree').setup(opts)
end

return plugin
