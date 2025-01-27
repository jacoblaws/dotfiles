local M = {}

M.load_options = function()
  local options = require('core.options')

  for scope, opt in pairs(options) do
    for setting, value in pairs(opt) do
      vim[scope][setting] = value
    end
  end
end

return M
