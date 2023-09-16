-- lualine
--
-- a blazing fast neovim statusline plugin

local opts = {
  options = {
    theme = 'auto',

    globalstatus = true,
    icons_enabled = true,

    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
}

local config = function(_, opts)
  if vim.g.colors_name == 'everforest' then
    opts.options.theme = require('plugins.themes.lualine.everforest')
  end

  require('lualine').setup(opts)
end

local dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'lewis6991/gitsigns.nvim',
}

local plugin_spec = {
  'nvim-lualine/lualine.nvim',

  lazy = true,
  event = 'VeryLazy',

  opts = opts,
  config = config,
  dependencies = dependencies,
}
return plugin_spec
