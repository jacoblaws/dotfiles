local M = {}

function M.neo_tree_open()
  local get_state = require('neo-tree.sources.manager').get_state
  local renderer = require('neo-tree.ui.renderer')

  local file_open = renderer.window_exists(get_state('filesystem'))
  local buf_open = renderer.window_exists(get_state('buffers'))
  local git_open = renderer.window_exists(get_state('git_status'))

  return file_open or buf_open or git_open
end

return M
