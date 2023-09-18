-- lualine
--
-- a blazing fast neovim statusline plugin

local icon = require('core.utils.icons')
local statusline = require('core.utils.statusline')

local opts = {
  options = {
    theme = 'auto',

    globalstatus = true,
    icons_enabled = true,

    section_separators = { left = '', right = '', },
    component_separators = { left = '', right = '' },
  },

  sections = {
    lualine_a = {
      {
        'mode',
        icon = { icon.vim },
        separator = {
          left = icon.left_separator,
          right = icon.right_separator
        },
      },
    },
    lualine_b = {
      {
        'filetype',
        colored = false,
        icon_only = true,
        padding = { left = 2, right = 0 },
      },
      {
        'filename',
        file_status = false,
        padding = { left = 1, right = 0 },
      },
    },
    lualine_c = {
      {
        'b:gitsigns_head',
        icon = { icon.git_branch },
        padding = { left = 2, right = 0 },
      },
      {
        'diff',
        source = statusline.diff_source,
        padding = { left = 2, right = 0 },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        padding = { left = 0, right = 2 },
      },
      {
        statusline.lsp_name,
        icon = { icon.lsp },
        padding = { left = 0, right = 2 },
      },

    },
    lualine_y = {},
    lualine_z = {
      {
        statusline.get_cwd,
        icon = { icon.folder_open, align = 'left' },
        padding = { left = 1, right = 2 },
        separator = {
          left = icon.left_separator,
          right = '',
        },
      },
      {
        'progress',
        icon = { icon.progress, align = 'left' },
        padding = { left = 0, right = 1 },
        separator = {
          left = '',
          right = icon.right_separator,
        },
      },
    },
  }
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
