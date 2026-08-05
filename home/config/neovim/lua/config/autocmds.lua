local autocmd = vim.api.nvim_create_autocmd
local function augroup(name) return vim.api.nvim_create_augroup('custom_' .. name, { clear = true }) end

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

autocmd('BufWritePre', {
  pattern = { '*.ly' },
  callback = function() vim.cmd('LilyCmp') end,
})

-- Disable single quote auto-pairing when in Rust buffers
autocmd({ 'FileType' }, {
  group = augroup('rust_disable_single_quote_pairs'),
  pattern = 'rust',
  callback = function() vim.keymap.set('i', "'", "'", { buffer = 0 }) end,
})
