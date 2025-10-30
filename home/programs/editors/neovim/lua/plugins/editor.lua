vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/folke/lazydev.nvim' },
})

-- stylua: ignore start

vim.lsp.enable({
  'bashls',        -- Bash
  'clangd',        -- C, C++
  'hls',           -- Haskell
  'lua_ls',        -- Lua
  'marksman',      -- Markdown
  'nixd',          -- Nix
  'nushell',       -- NuShell
  'purescriptls',  -- PureScript
  'rust_analyzer', -- Rust
  'taplo',         -- TOML
  'texlab',        -- Latex
  'tinymist',      -- Typst
  'ts_ls',         -- JavaScript, TypeScript
  'ty',            -- Python
})

---@diagnostic disable: missing-fields
require('nvim-treesitter.configs').setup({
  folds = { enable = true },
  highlight = { enable = true },
  indent = { enable = true },

  auto_install = true,
  insure_installed = {
    'bash', 'c',    'cpp',        'css',        'diff',   'haskell', 'html',     'javascript',
    'json', 'json', 'jsonc',      'kdl',        'latex',  'lua',     'markdown', 'markdown_inline',
    'nix',  'nu',   'printf',     'purescript', 'python', 'regex',   'rust',     'scss',
    'toml', 'tsx',  'typescript', 'typst',      'vim',    'vimdoc',  'xml',      'yaml',
  },
})

require('conform').setup({
  formatters_by_ft = {
    bash       = { 'shfmt' },
    haskell    = { 'fourmolu' },
    lua        = { 'stylua' },
    nix        = { 'nixfmt' },
    python     = { 'ruff_format' },
    rust       = { 'rustfmt' },
    toml       = { 'taplo' },
    nu         = { 'nufmt' },
    typst      = { 'typstyle' },
    purescript = { 'purs-tidy' },
  },

  default_format_opts = {
    lsp_format = 'fallback',
  },

  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 500,
  },
})

-- stylua: ignore end

require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})
