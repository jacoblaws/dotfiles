local M = {}

local utils = require('core.utils')

M.toggleterm = {
  plugin = true,
  n = {
    ['<leader>tl'] = { function() utils.toggleterm_cmd('lazygit') end, 'ToggleTerm lazygit' },
    ['<leader>tb'] = { function() utils.toggleterm_cmd('btm') end,     'ToggleTerm btm' },
    ['<leader>tp'] = { function() utils.toggleterm_cmd('python') end,  'ToggleTerm python' },

    ['<leader>tf'] = { '<cmd>ToggleTerm direction=float<cr>',      'ToggleTerm float' },
    ['<leader>th'] = { '<cmd>ToggleTerm direction=horizontal<cr>', 'ToggleTerm horizontal split' },
    ['<leader>tv'] = { '<cmd>ToggleTerm direction=vertical<cr>',   'ToggleTerm vertical split' },

    ['<F7>'] = { '<cmd>ToggleTerm<cr>', 'Toggle terminal' },
  },

  t = {
    ['<F7>'] = { '<cmd>ToggleTerm<cr>', 'Toggle terminal' },
    ["<C-'>"] = { '<cmd>ToggleTerm<cr>', 'Toggle terminal' },
  },
}

return M
