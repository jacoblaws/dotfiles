local plugin = {
  'snacks.nvim',
}

plugin.keys = {
  { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete buffer' },
}

plugin.opts = {
  bufdelete = {
    enabled = true,
  }
}

return plugin
