local M = {}

--@param option string
--@param state boolean
local function notify(option, state)
  if not state then
    vim.notify('Enabling ' .. option, vim.log.levels.INFO)
  else
    vim.notify('Disabling ' .. option, vim.log.levels.INFO)
  end
end

--@param opt string
function M.option(opt)
  local state = vim.o[opt]
  notify(opt, state)
  vim.o[opt] = not state
end

function M.background()
  local state = vim.o.background
  if state == 'dark' then
    vim.o.background = 'light'
    notify('light mode')
  else
    vim.o.background = 'dark'
    notify('dark mode')
  end
end

function M.cycle_number_options()
  if not vim.o.number then
    vim.o.number = true
    vim.notify('Enabling line numbers', vim.log.levels.INFO)
  elseif not vim.o.relativenumber then
    vim.o.relativenumber = true
    vim.notify('Enabling relative line numbers', vim.log.levels.INFO)
  else
    vim.o.number = false
    vim.o.relativenumber = false
    vim.notify('Disabling line numbers', vim.log.levels.INFO)
  end
end

function M.virtual_text()
  local state = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not state })
  notify('virtual text', state)
end

function M.virtual_lines()
  local state = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = not state })
  notify('virtual lines', state)
end

return M
