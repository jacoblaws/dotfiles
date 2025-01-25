-- gitsigns
--
-- super fast git decorations

local icon = require('utils.icons')

local plugin = {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' }
}

plugin.opts = {
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame line')
    map('n', '<leader>ghB', function() gs.blame() end, 'Blame buffer')
    map('n', '<leader>ghd', gs.diffthis, 'Diff this')
    map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff this ~')
    map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview hunk inline')
    map('n', '<leader>ghR', gs.reset_buffer, 'Reset buffer')
    map('n', '<leader>ghS', gs.stage_buffer, 'Stage buffer')
    map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo stage hunk')
    map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<cr>', 'Stage hunk')
    map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<cr>', 'Reset hunk')
  end,

  signs = {
    add          = { text = icon.git.sign },
    change       = { text = icon.git.sign },
    delete       = { text = icon.git.sign },
    topdelete    = { text = icon.git.sign },
    changedelete = { text = icon.git.sign },
    untracked    = { text = icon.git.sign_untracked },
  },

  signs_staged = {
    add          = { text = icon.git.sign },
    change       = { text = icon.git.sign },
    delete       = { text = icon.git.sign },
    topdelete    = { text = icon.git.sign },
    changedelete = { text = icon.git.sign },
    untracked    = { text = icon.git.sign_untracked },
  },
  signs_staged_enable = true,

  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,

  preview_config = {
    border = 'rounded',
  },
}

plugin.config = function(_, opts)
  require('gitsigns').setup(opts)
end

return plugin
