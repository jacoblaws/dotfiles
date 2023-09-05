local M = {}

M.load_options = function()
  local options = require('core.options')

  for scope, opt in pairs(options) do
    for setting, value in pairs(opt) do
      vim[scope][setting] = value
    end
  end
end

M.load_keymaps = function(section)
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        for keymap, keymap_info in pairs(mode_values) do
          local opts = keymap_info.opts or {}

          keymap_info.opts, opts.mode = nil, nil
          opts.desc = keymap_info[2]

          vim.keymap.set(mode, keymap, keymap_info[1], opts)
        end
      end
    end

    local keymaps = require("core.keymaps")

    if type(section) == 'string' then
      keymaps[section]['plugin'] = nil
      keymaps = { keymaps[section] }
    end

    for _, sect in pairs(keymaps) do
      set_section_map(sect)
    end

  end)
end

return M
