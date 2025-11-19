-- stylua: ignore start

local options = {
  -- General ---------------------------------------------------------------------------------------
  backup         = false,     -- Don't store backup
  mouse          = 'a',       -- Enable mouse support
  mousemoveevent = true,      -- Enable mouse move events
  swapfile       = false,     -- Don't create swap files
  switchbuf      = 'usetab',  -- Use already opened buffers when switching
  undofile       = true,      -- Enable persistent undo
  writebackup    = false,     -- Don't store backup

  -- Editor ----------------------------------------------------------------------------------------
  autoindent    = true,       -- Enable auto indent
  expandtab     = true,       -- Convert tabs to spaces
  formatoptions = 'rqnl1j',   -- Improve comment editing
  ignorecase    = true,       -- Ignore case when searching
  incsearch     = true,       -- Show search results while typing
  infercase     = true,       -- Infer letter case for built-in keyword completion
  shiftround    = true,       -- Round indent to multiple of 'shiftwidth'
  shiftwidth    = 2,          -- Set default indentation to two spaces
  shortmess     = 'CFOSWaco', -- Dsiable some built-in completion messages
  smartindent   = true,       -- Don't ignore case when using captials
  tabstop       = 2,          -- Insert two spaces for a tab
  virtualedit   = 'block',    -- Allow going past the end of line in visual block mode

  clipboard   = 'unnamedplus',                   -- Enable universal clipboard
  complete    = '.,w,b,kspell',                  -- Set insert mode completion matches
  completeopt = 'menuone,noselect,fuzzy,nosort', -- Set menu options for insert mode completion
  iskeyword   = '@,48-57,_, 192-255,-',          -- Treat dash separated words as a word text object

  -- UI --------------------------------------------------------------------------------------------
  breakindent    = true,      -- Indent wrapped lines on the same column
  breakindentopt = 'list:-1', -- Add padding for lists when 'wrap' is enabled
  cmdheight      = 0,         -- Hide command line unless needed
  colorcolumn    = '',        -- Don't draw the color column
  cursorline     = false,     -- Don't draw the cursor line
  laststatus     = 3,         -- Set global status line
  linebreak      = true,      -- Wrap lines at 'breakat' (if 'wrap' is enabled)
  list           = true,      -- Show helpful text indicators
  number         = true,      -- Show line numbers
  pumheight      = 10,        -- Make popup menu smaller
  relativenumber = true,      -- Show relative line numbers
  ruler          = false,     -- Don't show cursor position
  showmode       = false,     -- Don't show mode in the command line
  signcolumn     = 'yes',     -- Always show the sign column
  splitbelow     = true,      -- Horizontal splits will be below
  splitright     = true,      -- Vertical splits will be to the right
  winborder      = 'rounded', -- Use a rounded border in floating windows
  wrap           = false,     -- Don't wrap text

  -- Various UI characters
  fillchars = {
    horiz     = '━',
    horizup   = '┻',
    horizdown = '┳',
    vert      = '┃',
    vertleft  = '┫',
    vertright = '┣',
    verthoriz = '╋',
    eob       = ' ',
  },
}

-- Set indicated options
for opt, val in pairs(options) do
  vim.opt[opt] = val
end

-- Use '<Space>' as the leader key
vim.g.mapleader   = ' '
vim.g.localleader = ' '

-- stylua: ignore end
