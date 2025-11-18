vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

local function load_icons(type)
  local icons, lsp = _G.Config.icons[type], {}
  for icon, glyph in pairs(icons) do
    lsp[string.lower(icon)] = { glyph = glyph }
  end
  return lsp
end

-- stylua: ignore start

-- General -----------------------------------------------------------------------------------------
require('mini.bracketed').setup()  -- Go forward/backward with square brackets
require('mini.bufremove').setup()  -- Remove buffers
require('mini.diff').setup()       -- Work with diff hunks
require('mini.git').setup()        -- Git integration
require('mini.jump').setup()       -- Jump to next/previous character
require('mini.jump2d').setup()     -- Jump within visible lines
require('mini.move').setup()       -- Move any selection in any direction
require('mini.trailspace').setup() -- Work with trailing whitespace

-- Icon provider
require('mini.icons').setup({ lsp = load_icons('kind') })
require('mini.icons').mock_nvim_web_devicons()

-- Manage and expand snippets
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    gen_loader.from_lang(),
  },
})

-- Text Editing ------------------------------------------------------------------------------------
require('mini.ai').setup()        -- Extend and create a/i text objects
require('mini.align').setup()     -- Align text interactively
require('mini.comment').setup()   -- Comment lines
require('mini.operators').setup() -- Text editing operators
require('mini.pairs').setup()     -- Autopairs
require('mini.splitjoin').setup() -- Split and join arguments
require('mini.surround').setup()  -- Surround actions

-- stylua: ignore end
