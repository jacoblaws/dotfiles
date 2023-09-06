-- neo-tree.nvim
--
-- for browsing the file system or other tree-like structures

local icon = require('core.utils.icons')

local opts = {
  hide_root_node = true,
  close_if_last_window = false,
  retain_hidden_root_ident = true,
  auto_clean_after_session_restore = true,

  default_component_configs = {
    modified = { symbol = icon.file_modified },

    icon = {
      default = icon.file_default,
      folder_open = icon.folder_open,
      folder_closed = icon.folder_closed,
      folder_empty = icon.folder_empty,
    },

    git_status = {
      symbols = {
        added = icon.git_add,
        deleted = icon.git_delete,
        modified = icon.git_modified,
        renamed = icon.git_renamed,
        untracked = icon.git_untracked,
        ignored = icon.git_ignored,
        staged = icon.git_staged,
        unstaged = icon.git_unstaged,
        conflict = icon.git_conflict,
      },
    },
  },
}

local config = function(_, opts)
  require('neo-tree').setup(opts)
end

local init = function()
  require('core.utils').load_keymaps('neo_tree')
end

local dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
}

local plugin_spec = {
  'nvim-neo-tree/neo-tree.nvim',

  lazy = true,
  branch = 'v3.x',

  cmd = 'Neotree',

  init = init,
  opts = opts,
  config = config,
  dependencies = dependencies
}
return plugin_spec
