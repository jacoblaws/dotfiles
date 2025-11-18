require('themes')
vim.cmd('colorscheme everforest')

require('config.globals')
require('config.options')
require('config.keymaps')
require('config.autocmds')

require('plugins.mini')
require('plugins.snacks')
require('plugins.editor')
require('plugins.ui')

-- Custom statusline
vim.opt.statusline = "%!v:lua.require('config.ui.statusline').render()"
