local M = {}

local find = require('core.utils.find')

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

M.neo_tree = {
  plugin = true,

  n = {
    ['<leader>e'] = {
      function()
        require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      'Toggle Explorer',
    },
    ['<leader>o'] = {
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      'Focus Explorer',
    },
  },
}

return M
