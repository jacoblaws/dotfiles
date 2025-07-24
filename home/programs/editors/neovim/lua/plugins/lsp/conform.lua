local plugin = {
  'stevearc/conform.nvim',
  lazy = true,
  cmd = 'ConformInfo',
  event = 'BufWritePre',
}

plugin.keys = {
  {
    '<leader>cf',
    function()
      require('conform').format()
    end,
    mode = { 'n', 'v' },
    desc = 'Format',
  },
  {
    '<leader>cF',
    function()
      require('conform').format({
        formatters = { 'injected' },
        timeout_ms = 3000,
      })
    end,
    mode = { 'n', 'v' },
    desc = 'Format injected langs',
  },
}

plugin.opts = {
  formatters_by_ft = {
    lua = { 'stylua' },
    nix = { 'nixfmt' },
    python = { 'ruff_format' },
    rust = { 'rustfmt' },
    toml = { 'taplo' },
    haskell = { 'ormolu' },
  },

  default_format_opts = {
    async = false,
    quiet = false,
    timeout_ms = 3000,
    lsp_format = 'fallback',
  },

  formatters = {
    injected = { options = { ignore_errors = true } },
  },
}

plugin.config = function(_, opts)
  require('conform').setup(opts)

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
      require('conform').format({ bufnr = args.buf })
    end,
  })
end

return plugin
