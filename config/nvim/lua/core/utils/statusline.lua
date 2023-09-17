local M = {}

function M.get_current_filetype()
  return vim.api.nvim_buf_get_option(0, 'filetype')
end

function M.lsp_name()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return '' end

  local buf_ft = M.get_current_filetype()
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
      return client.name
    end
  end
  return ''
end

function M.diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return M
