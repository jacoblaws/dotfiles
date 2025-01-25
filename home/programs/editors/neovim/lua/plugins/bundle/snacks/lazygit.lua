local plugin = {
  'snacks.nvim',
}

local open_lazygit = function() Snacks.lazygit() end

plugin.keys = {
  { '<leader>gg', open_lazygit, desc = 'Lazygit' },
  -- { '<leader>wtg', open_lazygit, desc = 'Lazygit' },
}

plugin.opts = {
  lazygit = {
    enabled = true,
  },

  styles = {
    lazygit = {
      backdrop = false,
    },
  },
}

return plugin
