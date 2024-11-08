local M = {}

function M.is_valid(bufnr)
  if not bufnr then bufnr = 0 end
  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

function M.cycle_next()
  require('cokeline.mappings').by_step('focus', 1)
end

function M.cycle_prev()
  require('cokeline.mappings').by_step('focus', -1)
end

function M.close()
  if not M.is_valid() then return end

  local index = require('cokeline.buffers').get_current().index
  require('cokeline.mappings').by_index('close', index)
end

return M
