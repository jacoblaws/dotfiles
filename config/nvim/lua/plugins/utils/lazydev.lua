-- lazydev
--
-- configures LuaLS for editing your Neovim config
-- by lazily updating your workspace libraries

local plugin = {
  'folke/lazydev.nvim',

  ft = 'lua',
  dependencies = { "Bilal2453/luvit-meta" },
}

plugin.opts = {
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  }
}

return plugin
