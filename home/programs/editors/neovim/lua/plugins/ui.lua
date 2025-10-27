vim.pack.add({{ src = 'https://github.com/A7Lavinraj/fyler.nvim', version = 'stable' }})

require('fyler').setup({
  confirm_simple = true,
  default_explorer = true,
  win = {
    border = 'rounded',
    kind = 'float',
  },
})
