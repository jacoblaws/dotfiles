-- blink.cmp
--
-- completion plugin with support for LSPs and external sources

local kinds = require('core.utils.icons').kinds

local plugin = {
  'saghen/blink.cmp',

  lazy = false, -- lazy loading handled internally
  version = '*', -- release tag used to download pre-built binaries
  dependencies = 'rafamadriz/friendly-snippets',
  opts_extend = { 'sources.default' }
}

plugin.opts = {
  keymap = {
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e'] = { 'hide', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },

    ['<Tab>'] = {
      function(cmp)
        if cmp.snippet_active() then return cmp.accept()
        else return cmp.select_and_accept() end
      end,
      'snippet_forward',
      'fallback',
    },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  completion = {
    menu = {
      enabled = true,
      border = 'rounded',

      draw = {
        gap = 1, -- padding between columns
        padding = 1, -- left and right padding

        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
      },
    },

    documentation = {
      auto_show = true,
      window = {
        border = 'rounded',
      },
    },

    list = {
      selection = { preselect = false, auto_insert = true },
    },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'normal',

    kind_icons = {
      Text = kinds.text,
      Method = kinds.method,
      Function = kinds.func,
      Constructor = kinds.constructor,

      Field = kinds.field,
      Variable = kinds.variable,
      Property = kinds.property,

      Class = kinds.class,
      Interface = kinds.interface,
      Struct = kinds.struct,
      Module = kinds.module,

      Unit = kinds.unit,
      Value = kinds.value,
      Enum = kinds.enum,
      EnumMember = kinds.enum_member,

      Keyword = kinds.keyword,
      Constant = kinds.constant,

      Snippet = kinds.snippet,
      Color = kinds.color,
      File = kinds.file,
      Reference = kinds.reference,
      Folder = kinds.folder,
      Event = kinds.event,
      Operator = kinds.operator,
      TypeParameter = kinds.type_parameter,
    },
  },
}

return plugin
