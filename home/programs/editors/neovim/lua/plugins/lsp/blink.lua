-- blink.cmp
--
-- completion plugin with support for LSPs and external sources

local kinds = require('core.utils.icons').kinds

local plugin = {
  'saghen/blink.cmp',

  lazy = false, -- lazy loading handled internally
  version = 'v0.*', -- release tag used to download pre-built binaries
  dependencies = 'rafamadriz/friendly-snippets',
  opts_extend = { 'sources.default' }
}

plugin.opts = {
  keymap = { preset = 'default' },

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
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',

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
