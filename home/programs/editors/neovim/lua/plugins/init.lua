local plugins = {
  -- utils
  require('plugins.utils.lazydev'),
  require('plugins.utils.luasnip'),
  require('plugins.utils.nvim-web-devicons'),

  -- colorschemes
  require('plugins.themes.everforest'),

  -- lsp
  require('plugins.lsp.blink'),
  require('plugins.lsp.mason'),
  require('plugins.lsp.mason-lspconfig'),
  require('plugins.lsp.nvim-lspconfig'),

  -- language
  require('plugins.lang.rustaceanvim'),

  -- editor
  require('plugins.editor.treesitter'),
  require('plugins.editor.gitsigns'),
  require('plugins.editor.neo-tree'),
  require('plugins.editor.telescope'),
  require('plugins.editor.toggleterm'),

  -- ui
  require('plugins.ui.cokeline'),
  require('plugins.ui.which-key'),
  require('plugins.ui.lualine'),
  require('plugins.ui.dashboard-nvim'),
}
return plugins
