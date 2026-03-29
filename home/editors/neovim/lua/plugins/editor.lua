vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  { src = 'https://github.com/stevearc/conform.nvim' },
  { src = 'https://github.com/folke/lazydev.nvim' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  { src = 'https://github.com/martineausimon/nvim-lilypond-suite' },
})

-- stylua: ignore start

vim.lsp.enable({
  'bashls',        -- Bash
  'clangd',        -- C, C++
  'emmylua_ls',    -- Lua
  'hls',           -- Haskell
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

local parsers = {
  -- Programming langugages
  'c', 'cpp', 'haskell', 'javascript', 'lua', 'nix', 'purescript', 'python', 'rescript', 'rust',
  -- Shell
  'bash', 'elvish', 'fish', 'nu', 'zsh',
  -- Markup
  'html', 'latex', 'markdown', 'markdown_inline', 'typst',
  -- Utilities
  'cmake', 'comment', 'css', 'diff', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit',
  'gitignore', 'json', 'json5', 'just', 'kdl', 'luadoc', 'luap', 'printf', 'query', 'regex',
  'scss', 'toml', 'tsx', 'vim', 'vimdoc', 'xml', 'yaml',
}

-- Install missing parsers
local isnt_installed = function(lang)
  return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
end
local to_install = vim.tbl_filter(isnt_installed, parsers)
if #to_install > 0 then require('nvim-treesitter').install(to_install) end

-- Find filetypes for autocmd
local filetypes = {}
for _, lang in ipairs(parsers) do
  for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
    table.insert(filetypes, ft)
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function(ev)
    vim.treesitter.start(ev.buf)
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
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

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  appearance = { nerd_font_variant = 'normal' },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  snippets = { preset = 'mini_snippets' },

  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },

  completion = {
    documentation = { auto_show = false },
    menu = {
      draw = {
        gap = 1,
        padding = 1,
        treesitter = { 'lsp' },
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },
})

require('nvls').setup({
  lilypond = {
    mappings = {
      player = '<leader>lp',
      compile = '<leader>lc',
      open_pdf = '<leader>lv',
    },
  },
})
