local icons = _G.Config.icons
local mini_icons = require('mini.icons')
local modes = require('config.ui').modes
local lsep, rsep = '', ''

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local text = modes[current_mode].text
  local mhl = '%#' .. modes[current_mode].hl .. '#'
  local shl = '%#' .. modes[current_mode].hl .. 'Sep#'
  return string.format('%s%s%s %s %s%s', shl, lsep, mhl, text, shl, rsep)
end

local function current_file()
  local name = vim.fn.expand('%:t')
  local icon = mini_icons.get('filetype', vim.bo.filetype)
  return string.format(' %s %s ', icon, name)
end

local function branch()
  local summary = vim.b.minigit_summary
  if not summary then return '' end
  return string.format(' %s %s ', '󰘬', summary.head_name)
end

local function diff()
  local summary = vim.b.minidiff_summary_string
  if not summary then return '' end
  return string.format(' %s ', summary)
end

local function diagnostics()
  if not vim.diagnostic.get(0) then return '' end

  local count = { 0, 0, 0, 0 }
  for _, d in ipairs(vim.diagnostic.get(0)) do
    count[d.severity] = count[d.severity] + 1
  end

  local text = {}
  local severity = vim.diagnostic.severity
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
  return ' ' .. table.concat(text, ' ') .. ' '
end

local function ruler()
  if not vim.o.ruler then return '' end
  return string.format(' %s %s ', '󰍎', '%l|%c%V')
end

local function lsp()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })
  if not clients then return '' end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  if not names then return '' end

  return string.format(' %s %s ', '󰂾', table.concat(names, ', '))
end

local function cwd()
  local current_mode = vim.api.nvim_get_mode().mode
  local icon = '󰝰'
  local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local mhl = '%#' .. modes[current_mode].hl .. '#'
  local shl = '%#' .. modes[current_mode].hl .. 'Sep#'
  return string.format('%s%s%s %s %s %s%s', shl, lsep, mhl, icon, dir, shl, rsep)
end

local M = {}

function M.render()
  return table.concat({
    mode(),
    '%#StatusLine#',
    current_file(),
    branch(),
    diff(),
    '%=',
    diagnostics(),
    ruler(),
    lsp(),
    cwd(),
  })
end

return M
