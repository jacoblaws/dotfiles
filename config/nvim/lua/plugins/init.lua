local plugins = {
  -- colorschemes
  require('plugins.themes.everforest'),

  -- lang utils
  require('plugins.lang.utils.mason'),
  require('plugins.lang.utils.luasnip'),

  -- lsp
  require('plugins.lang.lsp.nvim-cmp'),
  require('plugins.lang.lsp.cmp-nvim-lsp'),
  require('plugins.lang.lsp.mason-lspconfig'),

  -- editor
  require('plugins.editor.treesitter'),
  require('plugins.editor.gitsigns'),
  require('plugins.editor.neo-tree'),
  require('plugins.editor.telescope'),
  require('plugins.editor.toggleterm'),

  -- ui
  require('plugins.ui.cokeline'),
  require('plugins.ui.which-key'),

}
return plugins
