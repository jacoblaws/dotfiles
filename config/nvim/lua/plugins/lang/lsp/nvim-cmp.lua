-- nvim-cmp
--
-- a completion engine for neovim
-- completion sources are installed from external repositories

local opts = {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
}

local config = function(_, opts)
  require('cmp').setup(opts)
end

local dependencies = {
  'L3MON4D3/LuaSnip',
}

local plugin_spec = {
  'hrsh7th/nvim-cmp',

  lazy = true,
  event = 'InsertEnter',

  opts = opts,
  config = config,
  dependencies = dependencies,
}
return plugin_spec
