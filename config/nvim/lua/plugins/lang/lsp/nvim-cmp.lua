-- nvim-cmp
--
-- a completion engine for neovim
-- completion sources are installed from external repositories

local opts = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local lspkind = require('lspkind')

  return {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip'  },
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    formatting = {
      fields = {'abbr', 'kind', 'menu'},
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        ellipsis_char = '...',
      }),
    },
  }
end

local config = function(_, opts)
  require('cmp').setup(opts)
end

local dependencies = {
  'L3MON4D3/LuaSnip',
  'onsails/lspkind.nvim',
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
