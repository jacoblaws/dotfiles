local plugin = {
  'snacks.nvim',
}

plugin.opts = {
  toggle = {
    enabled = true,
    map = vim.keymap.set,
    which_key = false,
    notify = true,
  },
}

plugin.init = function()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
      Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
      Snacks.toggle.option('wrap', { name = 'Line wrap' }):map('<leader>uw')
      Snacks.toggle.option('number', { name = 'Line numbers' }):map('<leader>ul')
      Snacks.toggle.option('relativenumber', { name = 'Relative line numbers' }):map('<leader>uL')
    end,
  })
end

return plugin
