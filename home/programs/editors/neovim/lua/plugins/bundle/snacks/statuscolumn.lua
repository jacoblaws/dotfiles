local plugin = {
  'snacks.nvim'
}

plugin.opts = {
  statuscolumn = {
    enabled = true,

    left = { 'mark', 'sign' },
    right = { 'fold', 'git' },

    folds = {
      open = false,
      git_hl = false,
    },

    git = {
      patterns = { 'GitSigns', 'MiniDiffSign' },
    },

    refresh = 50,
  }
}

return plugin
