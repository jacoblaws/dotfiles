local M = {}

local icons = _G.Config.icons
local modes = require('config.ui').modes
local mini_icons = require('mini.icons')

local function pad(width) return string.rep(' ', width) end

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local mhl = '%#' .. modes[current_mode].hl .. '#'
  return mhl .. '╼'
end

local function file()
  local name = vim.fn.expand('%:t')
  local ft = vim.bo.filetype
  local icon = mini_icons.get('filetype', vim.bo.filetype)
  return string.format('%s %s', icon, name)
end

local function lsp()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })
  if next(clients) == nil then return '' end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  if next(names) == nil then return '' end

  return string.format('%s %s', '󱘖', table.concat(names, ', '))
end

local function ruler()
  if not vim.o.ruler then return '' end
  return string.format('%s %s', '󰟙', '%l:%c')
end

local function diagnostics()
  local diag = vim.diagnostic.get(0)
  if not diag then return '' end

  local count = { 0, 0, 0, 0 }
  for _, d in ipairs(diag) do
    count[d.severity] = count[d.severity] + 1
  end

  local text, severity = {}, vim.diagnostic.severity
  if count[severity.ERROR] > 0 then
    table.insert(text, icons.diagnostics.error .. count[severity.ERROR])
  end
  if count[severity.WARN] > 0 then
    table.insert(text, icons.diagnostics.warn .. count[severity.WARN])
  end
  if count[severity.INFO] > 0 then
    table.insert(text, icons.diagnostics.info .. count[severity.INFO])
  end
  if count[severity.HINT] > 0 then
    table.insert(text, icons.diagnostics.hint .. count[severity.HINT])
  end
  if not text then return '' end
  return table.concat(text, ' ')
end

local function diff()
  local summary = vim.b.minidiff_summary_string
  if not summary then return '' end
  return summary
end

local function branch()
  local summary = vim.b.minigit_summary
  if not summary then return '' end
  return '󰘬 ' .. tostring(summary.head_name)
end

local function repo()
  local summary = vim.b.minigit_summary
  if not summary then return '' end
  return '󰛓 ' .. vim.fs.basename(summary.root)
end

function M.render()
  return table.concat({
    mode(),
    '%#StatusLine#',
    pad(2),
    file(),
    pad(1),
    lsp(),
    pad(1),
    diagnostics(),
    pad(1),
    ruler(),
    '%=',
    diff(),
    pad(1),
    branch(),
    pad(1),
    repo(),
  })
end

return M
