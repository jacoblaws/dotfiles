vim.pack.add({
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/A7Lavinraj/fyler.nvim', version = 'stable' },
})

require('which-key').setup({
  preset = 'helix',
  icons = {
    group = '',
    mappings = false,
  },
})

require('which-key').add({
  { '<leader>b', group = '󰌨 Buffer' },
  { '<leader>f', group = '󰍉 Find' },
  { '<leader>g', group = '󰊢 Git' },
  { '<leader>l', group = '󰅴 Language' },
  { '<leader>t', group = '󰔡 Toggle' },
})

require('fyler').setup({
  confirm_simple = true,
  default_explorer = true,
  win = {
    border = 'rounded',
    kind = 'float',
  },
})
