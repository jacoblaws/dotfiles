local autocmd = vim.api.nvim_create_autocmd

autocmd('User', {
  pattern = 'MiniDiffUpdated',
  callback = function(data)
    local summary = vim.b[data.buf].minidiff_summary
    if not summary then return end

    local text = {}
    if summary.add > 0 then table.insert(text, '+' .. summary.add) end
    if summary.change > 0 then table.insert(text, '~' .. summary.change) end
    if summary.delete > 0 then table.insert(text, '-' .. summary.delete) end
    vim.b[data.buf].minidiff_summary_string = table.concat(text, ' ')
  end,
})
