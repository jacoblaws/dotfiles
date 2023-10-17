local M = {}

function M.cycle_next()
  require('cokeline.mappings').by_step('focus', 1)
end

function M.cycle_prev()
  require('cokeline.mappings').by_step('focus', -1)
end

return M
