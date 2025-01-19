-- lualine
--
-- a blazing fast neovim statusline plugin

local icon = require('utils.icons')
local statusline = require('utils.statusline')

local plugin = {
  'nvim-lualine/lualine.nvim',

  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
}

plugin.opts = {
  options = {
    theme = 'auto',

    globalstatus = true,
    icons_enabled = true,

    section_separators = { left = '', right = '', },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { statusline = { 'dashboard' } },
  },

  sections = {
    lualine_a = {
      {
        'mode',
        icon = { icon.logo.vim },
        separator = {
          left = icon.statusline.left_separator,
          right = icon.statusline.right_separator,
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
        padding = { left = 0, right = 0 },
      },
    },
    lualine_c = {
      {
        'b:gitsigns_head',
        icon = { icon.git.branch },
        padding = { left = 2, right = 0 },
      },
      {
        'diff',
        symbols = {
          added = icon.git.added .. ' ',
          modified = icon.git.modified .. ' ',
          removed = icon.git.removed .. ' ',
        },
        source = statusline.diff_source,
        padding = { left = 2, right = 0 },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        padding = { left = 0, right = 1 },
      },
      {
        statusline.lsp_name,
        icon = { icon.statusline.lsp },
        padding = { left = 0, right = 2 },
      },
    },
    lualine_y = {},
    lualine_z = {
      {
        statusline.get_cwd,
        icon = { icon.folder.open, align = 'left' },
        padding = { left = 1, right = 1 },
        separator = {
          left = icon.statusline.left_separator,
          right = '',
        },
      },
      {
        'progress',
        icon = { icon.statusline.progress, align = 'left' },
        padding = { left = 0, right = 1 },
        separator = {
          left = '',
          right = icon.statusline.right_separator,
        }
      },
    },
  }
}

plugin.config = function(_, opts)
  if vim.g.colors_name == 'everforest' then
    opts.options.theme = require('plugins.themes.lualine.everforest')
  end

  vim.o.laststatus = vim.g.lualine_laststatus
  require('lualine').setup(opts)
end

plugin.init = function()
  vim.g.lualine_laststatus = vim.o.laststatus
  if vim.fn.argc(-1) > 0 then
    vim.o.statusline = ''
  else
    vim.o.laststatus = 0
  end
end

return plugin
