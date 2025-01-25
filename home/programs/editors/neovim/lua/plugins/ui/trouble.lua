local plugin = {
  'folke/trouble.nvim',
  cmd = 'Trouble',
}

plugin.keys = {
 { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagonstics'},
 { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer diagnostics' },
 { '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols' },
 { '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP definitions' },
 { '<leader>xL', '<cmd>Trouble toclist toggle<cr>', desc = 'Location list (Trouble)' },
 { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix list (Trouble)' },
}

plugin.opts = {
}

return plugin
