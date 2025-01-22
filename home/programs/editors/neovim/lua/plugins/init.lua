local plugins = {
  -- utils
  require('plugins.utils.lazydev'),
  require('plugins.utils.luasnip'),
  require('plugins.utils.nvim-web-devicons'),

  -- colorschemes
  require('plugins.themes.everforest'),

  -- bundles
  require('plugins.bundle.mini'),
  require('plugins.bundle.snacks'),

  -- lsp
  require('plugins.lsp.blink'),
  require('plugins.lsp.nvim-lspconfig'),

  -- language
  require('plugins.lang.rustaceanvim'),

  -- editor
  require('plugins.editor.treesitter'),
  require('plugins.editor.gitsigns'),
  require('plugins.editor.telescope'),
  require('plugins.editor.toggleterm'),

  -- ui
  require('plugins.ui.cokeline'),
  require('plugins.ui.which-key'),
  require('plugins.ui.lualine'),
  require('plugins.ui.neo-tree'),
}
return plugins
