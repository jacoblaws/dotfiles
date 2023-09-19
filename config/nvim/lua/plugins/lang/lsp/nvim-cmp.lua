-- nvim-cmp
--
-- a completion engine for neovim
-- completion sources are installed from external repositories

local opts = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local lspkind = require('lspkind')

  local function has_words_before()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

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

    mapping = {
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4),  { 'i', 'c' }),

      ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ['<CR>'] = cmp.mapping.confirm { select = false },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end,
      { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      { 'i', 's' }),
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
