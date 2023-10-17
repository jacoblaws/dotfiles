local M = {}

local utils = require('core.utils')
local find = require('core.utils.find')
local git = require('core.utils.git')
local ui = require('core.utils.ui')
local buffer = require('core.utils.buffer')

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

M.git = {
  plugin = true,

  n = {
    ['<leader>gb'] = { git.branches,     'Git branches' },
    ['<leader>gC'] = { git.file_commits, 'Git commits (current file)' },
    ['<leader>gc'] = { git.repo_commits, 'Git commits (repository)' },
    ['<leader>gd'] = { git.view_diff,    'View Git diff' },
    ['<leader>gg'] = { git.lazygit,      'Lazygit' },
    ['<leader>gh'] = { git.reset_hunk,   'Reset Git hunk' },
    ['<leader>gL'] = { git.blame_full,   'View full git blame' },
    ['<leader>gl'] = { git.blame,        'View Git blame' },
    ['<leader>gp'] = { git.preview_hunk, 'Preview Git hunk' },
    ['<leader>gr'] = { git.reset_buffer, 'Reset Git buffer' },
    ['<leader>gs'] = { git.stage_hunk,   'Stage Git hunk' },
    ['<leader>gS'] = { git.stage_buffer, 'Stage Git buffer' },
    ['<leader>gt'] = { git.status,       'Git status' },
    ['<leader>gu'] = { git.unstage_hunk, 'Unstage Git hunk' },
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

M.buffer = {
  plugin = true,

  n = {
    ['<tab>']   = { buffer.cycle_next, 'Cycle buffer next' },
    ['<S-tab>'] = { buffer.cycle_prev, 'Cycle buffer prev' },
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
