local M = {}

function M.branches()
  require('telescope.builtin').git_branches()
end

function M.file_commits()
  require('telescope.builtin').git_bcommits()
end

function M.repo_commits()
  require('telescope.builtin').git_commits()
end

function M.status()
  require('telescope.builtin').git_status()
end

function M.view_diff()
  require('gitsigns').diffthis()
end

function M.lazygit()
  require('core.utils').toggleterm_cmd('lazygit')
end

function M.reset_hunk()
  require('gitsigns').reset_hunk()
end

function M.stage_hunk()
  require('gitsigns').stage_hunk()
end

function M.unstage_hunk()
  require('gitsigns').unstage_hunk()
end

function M.preview_hunk()
  require('gitsigns').preview_hunk()
end

function M.blame()
  require('gitsigns').blame_line()
end

function M.blame_full()
  require('gitsigns').blame_line { full = true }
end

function M.stage_buffer()
  require('gitsigns').stage_buffer()
end

function M.reset_buffer()
  require('gitsigns').reset_buffer()
end

return M
