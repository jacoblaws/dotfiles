local plugins = {
  require('plugins.ui.nvim-web-devicons'),

  -- colorschemes
  require('plugins.themes.everforest'),

  -- lang utils
  require('plugins.lang.utils.mason'),
  require('plugins.lang.utils.luasnip'),
  require('plugins.lang.utils.neodev'),

  -- lsp
  require('plugins.lang.lsp.lspkind'),
  require('plugins.lang.lsp.nvim-cmp'),
  require('plugins.lang.lsp.cmp-nvim-lsp'),
  require('plugins.lang.lsp.mason-lspconfig'),
  require('plugins.lang.lsp.nvim-lspconfig'),

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
}
return plugins
