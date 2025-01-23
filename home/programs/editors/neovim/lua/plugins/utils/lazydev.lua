-- lazydev
--
-- configures LuaLS for editing your Neovim config
-- by lazily updating your workspace libraries

local plugin = {
  'folke/lazydev.nvim',
  ft = 'lua',
}

plugin.opts = {
  library = {
    { path = '${3rd}/luv/library', words = { "vim%.uv" } },
    { path = 'snacks.nvim', words = { "Snacks" } },
  }
}

return plugin
