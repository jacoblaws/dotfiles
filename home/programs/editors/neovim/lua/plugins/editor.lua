vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
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

-- stylua: ignore end
