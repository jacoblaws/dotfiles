local M = {}

function M.neo_tree_open()
  local get_state = require('neo-tree.sources.manager').get_state
  local renderer = require('neo-tree.ui.renderer')

  local file_open = renderer.window_exists(get_state('filesystem'))
  local buf_open = renderer.window_exists(get_state('buffers'))
  local git_open = renderer.window_exists(get_state('git_status'))

  return file_open or buf_open or git_open
end

function M.toggle_numbers()
  vim.wo.number = not vim.wo.number
end

function M.toggle_rel_numbers()
  vim.wo.relativenumber = not vim.wo.relativenumber
end

function M.toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap
end

function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell
end

function M.toggle_statusline()
  vim.opt.laststatus = vim.opt.laststatus:get() == 0 and 3 or 0
end

function M.toggle_tabline()
  vim.opt.showtabline = vim.opt.showtabline:get() == 0 and 2 or 0
end

return M
