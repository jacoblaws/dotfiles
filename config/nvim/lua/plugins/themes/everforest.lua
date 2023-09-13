-- everforest
--
-- a green-based color scheme; designed to be warm and soft

local opts = {
  background = 'medium',
  ui_contrast = 'low',

  italics = false,
  disable_italic_comments = false,

  show_eob = false,

  on_highlights = function(hl, palette)
    -- neovim
    hl.WinSeparator = { fg = palette.bg_dim, bg = palette.bg0 }

    -- cokeline
    hl.CokeLineFill = { bg = palette.bg_dim }
    hl.CokeLineBufferActive = { fg = palette.fg, bg = palette.bg0 }
    hl.CokeLineBufferInactive = { fg = palette.grey0, bg = '#262d32' }
  end
}

local config = function(_, opts)
  require('everforest').setup(opts)
  vim.cmd[[ colorscheme everforest ]]
end

local plugin_spec = {
  'neanias/everforest-nvim',

  lazy = false,
  version = false,
  priority = 1000,

  opts = opts,
  config = config,
}
return plugin_spec
