-- nvim-treesitter
--
-- an abstraction layer for treesitter in neovim
--
-- tree-sitter is a parser generator tool and incremental parsing library
--
-- it can build a concrete syntax tree for a source file and efficiently
-- update the syntax tree as the source file is edited

local plugin = {
  'nvim-treesitter/nvim-treesitter',

  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
}

plugin.opts = {
  indent    = { enable = true },
  highlight = { enable = true },
  incremental_selection = { enable = true },

  auto_install = true,
  ensure_installed = {
    -- langs
    'c',
    'cpp',
    'rust',
    'python',
    'javascript',
    'typescript',
    'nix',

    -- utils
    'comment',
    'regex',
    'query',
    'yaml',
    'toml',
    'bash',
    'fish',
    'cmake',

    -- for neovim config
    'lua',
    'luadoc',
    'vim',
    'vimdoc',
    'markdown',
    'markdown_inline',
  },
}

plugin.config = function(_, opts)
  require('nvim-treesitter.configs').setup(opts)
end

return plugin
