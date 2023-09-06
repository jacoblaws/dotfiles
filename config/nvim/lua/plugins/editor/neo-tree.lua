-- neo-tree.nvim
--
-- for browsing the file system or other tree-like structures

local opts = {
  hide_root_node = true,
  close_if_last_window = false,
  retain_hidden_root_ident = true,
  auto_clean_after_session_restore = true,
}

local config = function(_, opts)
  require('neo-tree').setup(opts)
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

  opts = opts,
  config = config,
  dependencies = dependencies
}
return plugin_spec
