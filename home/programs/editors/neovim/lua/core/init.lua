require('core.options')
require('core.keymaps')
require('core.lsp')

-- bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim configuration
require('lazy').setup('plugins', {
  defaults = {
    lazy = true,
  },

  checker = {
    notify = false,
    enabled = false,
  },
})
