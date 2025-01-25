local plugin = {
  'folke/noice.nvim',
  event = 'VeryLazy',
}

plugin.opts = {
  lsp = {
    override = {
      ['vim.lsp.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },

  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
}

plugin.config = function(_, opts)
  require('noice').setup(opts)
end

return plugin
