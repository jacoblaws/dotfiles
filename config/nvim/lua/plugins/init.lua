local plugins = {
  -- colorschemes
  require('plugins.themes.everforest'),

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
