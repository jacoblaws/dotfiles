local M = {}

M.hl = function(fg, bg, ...)
  local hl = { fg = fg, bg = bg }
  for _, v in ipairs({ ... }) do
    hl[v] = true
  end
  return hl
end

M.set_hl = function(hl_tbl)
  for group, data in pairs(hl_tbl) do
    vim.api.nvim_set_hl(0, group, data)
  end
end

function M.load(theme)
  local mode = vim.o.background
  local spec = require('themes.palettes.' .. theme).generate_spec(mode)

  local function load_groups(path)
    local files = vim.fn.readdir(path)
    for _, file in ipairs(files) do
      local full_path = path .. '/' .. file
      if vim.fn.isdirectory(full_path) == 1 then
        load_groups(full_path)
      else
        M.set_hl(dofile(full_path).get(spec))
      end
    end
  end

  local path = vim.fn.stdpath('config') .. '/lua/themes/groups'
  load_groups(path)
end

return M
