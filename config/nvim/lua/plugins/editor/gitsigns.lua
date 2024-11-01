-- gitsigns
--
-- super fast git decorations

local icon = require('core.utils.icons')

local plugin = {
  'lewis6991/gitsigns.nvim',
}

plugin.opts = {
  numhl = false,
  linehl = false,
  word_diff = false,
  signcolumn = true,

  signs = {
    add          = { text = icon.git_sign },
    change       = { text = icon.git_sign },
    delete       = { text = icon.git_sign },
    topdelete    = { text = icon.git_sign },
    changedelete = { text = icon.git_sign },
    untracked    = { text = icon.git_sign_untracked },
  },
}

plugin.config = function(_, opts)
  require('gitsigns').setup(opts)
end

plugin.init = function()
  require('core.utils').load_keymaps('git')
end

return plugin
