vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

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

-- stylua: ignore end
