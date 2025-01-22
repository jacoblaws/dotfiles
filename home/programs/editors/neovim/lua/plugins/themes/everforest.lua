-- everforest
--
-- a green-based color scheme; designed to be warm and soft

local plugin = {
  'neanias/everforest-nvim',

  lazy = false,
  version = false,
  priority = 1000,
}

plugin.opts = {
  background = 'medium',
  ui_contrast = 'low',

  italics = false,
  disable_italic_comments = false,

  show_eob = false,

  on_highlights = function(hl, palette)
    -- neovim
    hl.WinSeparator = { fg = palette.bg_dim, bg = palette.bg0 }
    hl.NormalFloat = { bg = palette.bg0 }
    hl.Float = { bg = palette.bg0 }
    hl.FloatTitle = { bg = palette.bg0 }
    hl.FloatFooter = { bg = palette.bg0 }
    hl.FloatBorder = { fg = palette.fg, bg = palette.bg0 }

    -- neo-tree
    hl.NeoTreeNormal = { bg = palette.bg0 }
    hl.NeoTreeEndOfBuffer = { bg = palette.bg0 }

    hl.NeoTreeTabActive   = { fg = palette.fg, bg = palette.bg0 }
    hl.NeoTreeTabInactive = { fg = palette.grey0, bg = palette.bg_dim }

    hl.NeoTreeTabSeparatorActive   = { fg = palette.bg0, bg = palette.bg0 }
    hl.NeoTreeTabSeparatorInactive = { fg = palette.bg_dim, bg = palette.bg_dim }

    -- cokeline
    hl.CokeLineFill = { bg = palette.bg_dim }
    hl.CokeLineBufferActive = { fg = palette.fg, bg = palette.bg0 }
    --hl.CokeLineBufferInactive = { fg = palette.grey0, bg = '#262d32' }
    hl.CokeLineBufferInactive = { fg = palette.grey0, bg = palette.bg_dim }

    -- lualine
    hl.StatusLine = { bg = palette.bg0 }
    hl.StatusLineNC = { }

    -- blink.cmp
    hl.BlinkCmpMenu = { bg = palette.bg0 }
    hl.BlinkCmpMenuBorder = { fg = palette.fg, bg = palette.bg0 }
    hl.BlinkCmpMenuSelection = { bg = palette.bg1 }
    hl.BlinkCmpScrollBarThumb = { bg = palette.grey0 }
    hl.BlinkCmpDoc = { bg = palette.bg0 }
    hl.BlinkCmpDocBorder = { fg = palette.fg, bg = palette.bg0 }
    hl.BlinkCmpDocSeparator = { fg = palette.fg, bg = palette.bg0 }

    -- snacks.dashboard
    hl.SnacksDashboardHeader =  { fg = palette.yellow }
    hl.SnacksDashboardIcon = { fg = palette.yellow }
    hl.SnacksDashboardDesc = { fg = palette.fg }
    hl.SnacksDashboardKey = { fg = palette.green }
    hl.SnacksDashboardFooter = { fg = palette.orange }

    -- snacks.indent
    hl.SnacksIndent = { fg = palette.bg2 }
    hl.SnacksIndentScope = { fg = palette.bg2 }
  end
}

plugin.config = function(_, opts)
  require('everforest').setup(opts)
  vim.cmd[[ colorscheme everforest ]]
end

return plugin
