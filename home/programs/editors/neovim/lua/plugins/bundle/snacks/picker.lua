local icon = require('utils.icons')
local pick = require('utils.picker')

local plugin = {
  'snacks.nvim'
}

plugin.keys = {
  { '<leader>fa', pick.all_files, desc = 'All files' },
  { '<leader>fb', pick.buffers, desc = 'Buffers' },
  { '<leader>ff', pick.files, desc = 'Files' },
  { '<leader>fh', pick.highlights, desc = 'Highlights' },
  { '<leader>fr', pick.recent, desc = 'Recent' },

  { '<leader>gb', pick.git_branches, desc = 'Branches' },
  { '<leader>gd', pick.git_diff, desc = 'Diff' },
  { '<leader>gf', pick.git_log_file, desc = 'Current file history' },
  { '<leader>gl', pick.git_log, desc = 'Log' },
  { '<leader>gs', pick.git_status, desc = 'Status' },

  { '<leader>sc', pick.command_history, desc = 'Command history' },
  { '<leader>sC', pick.commands, desc = 'Commands' },
  { '<leader>sg', pick.grep, desc = 'Grep' },
  { '<leader>sG', pick.grep_all_files, desc = 'Grep all files' },
  { '<leader>sk', pick.keymaps, desc = 'Keymaps' },
  { '<leader>sh', pick.highlights, desc = 'Highlights' },
  { '<leader>sm', pick.marks, desc = 'Marks' },
  { '<leader>sM', pick.man, desc = 'Man pages' },
  { '<leader>sR', pick.resume, desc = 'Resume' },
  { '<leader>s"', pick.registers, desc = 'Registers' },
}

plugin.opts = {
  picker = {
    enabled = true,

    layouts = {
      default = {
        layout = {
          backdrop = false,
          box = 'horizontal',
          width = 0.8,
          min_width = 120,
          height = 0.8,
          {
            backdrop = false,
            box = 'vertical',
            border = 'rounded',
            title = '{title}{live}{flags}',
            { win = 'input', height = 1, border = 'bottom' },
            { win = 'list', border = 'none' },
          },
          { win = 'preview', title = '{preview}', border = 'rounded', width = 0.5, },
        },
      },
    },

    icons = {
      files = {
        enabled = true
      },

      diagnosticts = {
        Error = icon.diagnostics.error,
        Warn = icon.diagnostics.warn,
        Hint = icon.diagnostics.hint,
        Info = icon.diagnostics.info,
      },
    },
  },
}

return plugin
