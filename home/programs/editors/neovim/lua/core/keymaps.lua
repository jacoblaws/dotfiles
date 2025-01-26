local M = {}

local utils = require('core.utils')
local ui = require('core.utils.ui')

M.ui = {
  plugin = false,
  n = {
    ['<leader>ul'] = { ui.toggle_statusline,  'Toggle statusline' },
    ['<leader>un'] = { ui.toggle_numbers,     'Toggle numbers' },
    ['<leader>ur'] = { ui.toggle_rel_numbers, 'Toggle relative numbers' },
    ['<leader>us'] = { ui.toggle_spell,       'Toggle spell' },
    ['<leader>ut'] = { ui.toggle_tabline,     'Toggle tabline' },
    ['<leader>uw'] = { ui.toggle_wrap,        'Toggle wrap' },
  },
}

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
