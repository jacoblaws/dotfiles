local options = {
  opt = {
    -- line numbers
    number = true,              -- show line numbers
    numberwidth = 2,            -- minimum column width for line numbers
    relativenumber = true,      -- show relative line numbers

    -- indentation
    tabstop = 2,                -- number of spaces to insert for each indentation
    shiftwidth = 2,             -- default indent size
    shiftround = true,          -- round indent to multiple of 'shiftwidth'
    expandtab = true,           -- convert tabs to spaces
    smartindent = true,         -- insert indents automatically

    -- searching
    hlsearch = false,           -- don't highlight all search matches
    smartcase = true,	          -- don't ignore case when searching with capitals
    ignorecase = true,          -- default to case insensitive searching

    -- cursor
    cursorline = false,         -- highlight the text line of the cursor
    scrolloff = 8,              -- min number of lines to keep above/below the cursor
    sidescrolloff = 8,          -- min number of columns to keep left/right of the cursor

    -- splits
    splitbelow = true,          -- split new horizontal windows below the current one
    splitright = true,          -- split new vertical windows right of the current one

    -- wrap
    wrap = false,               -- disable wrapping on long lines of text
    linebreak = true,           -- only wrap lines at characters defined by 'breakat'

    -- status/buffer lines
    showmode = false,           -- disable mode notifications in the command line
    cmdheight = 0,              -- hide command line unless needed
    pumheight = 10,             -- popup menu height
    laststatus = 3,             -- global status line

    -- backups
    backup = false,             -- don't create file backups
    writebackup = false,        -- don't create file backups
    swapfile = false,           -- don't create swap files

    -- mouse
    mouse = 'a',                -- enable mouse support
    mousemoveevent = true,      -- enable mouse move events

    -- encoding
    encoding = 'utf-8',         -- internal string-encoding
    fileencoding = 'utf-8',     -- file-content encoding for the current buffer

    -- theme
    termguicolors = true,       -- enable 24-bit RGB color in the TUI
    fillchars = {               -- various ui characters
      horiz = '━',
      horizup = '┻',
      horizdown = '┳',
      vert = '┃',
      vertleft = '┫',
      vertright = '┣',
      verthoriz = '╋',
      eob = ' ',
    },

    -- misc
    ruler = false,              -- show the line/column of the cursor position
    history = 100,              -- number of commands to remember
    infercase = true,           -- infer case in keyword completion
    timeoutlen = 300,           -- milliseconds, wait time for a mapped sequence to complete
    updatetime = 300,           -- milliseconds, used for 'CursorHold' autocmd event
    clipboard = 'unnamedplus',  -- enable universal clipboard support
    completeopt = { 'menuone', 'noselect' }, -- menu options for insert mode completion
  },

  g = {
    -- leader key
    mapleader = ' ',
    localleader = ' ',
  },
}

-- load the options
for scope, opt in pairs(options) do
  for setting, value in pairs(opt) do
    vim[scope][setting] = value
  end
end
