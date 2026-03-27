local M = {}

-- stylua: ignore start

function M.get(spec)
  return {
    NeoTreeBufferNumber       = {},
    NeoTreeCursorLine         = {},
    NeoTreeDimText            = { link = 'NonText' },
    NeoTreeDirectoryIcon      = { link = 'Directory' },
    NeoTreeDirectoryName      = { link = 'Normal' },
    NeoTreeDotfile            = {},
    NeoTreeFileIcon           = { link = 'Directory' },
    NeoTreeFileName           = { link = 'Normal' },
    NeoTreeFileNameOpened     = {},
    NeoTreeFilterTerm         = {},
    NeoTreeFloatBorder        = { link = 'FloatBorder' },
    NeoTreeFloatTitle         = { link = 'FloatTitle' },
    NeoTreeGitAdded           = { link = 'Added' },
    NeoTreeGitConflict        = {},
    NeoTreeGitDeleted         = { link = 'Removed' },
    NeoTreeGitIgnored         = {},
    NeoTreeGitModified        = { link = 'Changed' },
    NeoTreeGitUnstaged        = {},
    NeoTreeGitUntracked       = {},
    NeoTreeGitStaged          = {},
    NeoTreeHiddenByName       = {},
    NeoTreeIgnored            = {},
    NeoTreeIndentMarker       = { link = 'NonText' },
    NeoTreeExpander           = { link = 'NonText' },
    NeoTreeNormal             = { link = 'Normal' },
    NeoTreeNormalNC           = { link = 'NormalNC' },
    NeoTreeSignColumn         = { link = 'SignColumn' },
    NeoTreeStats              = {},
    NeoTreeStatsHeader        = {},
    NeoTreeStatusLine         = { link = 'StatusLine' },
    NeoTreeStatusLineNC       = { link = 'StatusLineNC' },
    NeoTreeVertSplit          = { link = 'WinSeparator' },
    NeoTreeWinSeparator       = { link = 'WinSeparator' },
    NeoTreeEndOfBuffer        = { link = 'Normal' },
    NeoTreeRootName           = { link = 'Title' },
    NeoTreeSymbolicLinkTarget = {},
    NeoTreeTitleBar           = { link = 'Title' },
    NeoTreeWindowsHidden      = {},
  }
end

-- stylua: ignore end

return M
