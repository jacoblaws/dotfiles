local M = {}

local utils = require('core.utils')
local find = require('core.utils.find')
local ui = require('core.utils.ui')

M.find = {
  plugin = true,
  n = {
    ["<leader>f'"] = { find.marks,           'Find marks' },
    ['<leader>fa'] = { find.all_files,       'Find all files' },
    ['<leader>fb'] = { find.buffers,         'Find buffers' },
    ['<leader>fC'] = { find.commands,        'Find commands' },
    ['<leader>fc'] = { find.under_cursor,    'Find word under cursor' },
    ['<leader>ff'] = { find.files,           'Find files' },
    ['<leader>fH'] = { find.highlights,      'Find highlights' },
    ['<leader>fh'] = { find.help,            'Find help' },
    ['<leader>fk'] = { find.keymaps,         'Find keymaps' },
    ['<leader>fm'] = { find.man_pages,       'Find man pages' },
    ['<leader>fp'] = { find.prev_search,     'Find previous search' },
    ['<leader>fo'] = { find.old_files,       'Find old files' },
    ['<leader>fr'] = { find.registers,       'Find registers' },
    ['<leader>ft'] = { find.themes,          'Find themes' },
    ['<leader>fW'] = { find.words_all_files, 'Find words in all files' },
    ['<leader>fw'] = { find.words,           'Find words' },
  },
}


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
