local icon = require('utils.icons')

return {
  style = 'glyph',

  default = {
    default   = { glyph = icon.misc.null },
    directory = { glyph = icon.dir.default },
    extension = { glyph = icon.file.default },
    file      = { glyph = icon.file.default },
    filetype  = { glyph = icon.file.default },
    lsp       = { glyph = icon.lsp.default },
    os        = { glyph = icon.misc.os },
  },

  directory = {},
  extension = {},
  file      = {},
  filetype  = {},
  lsp       = {},
  os        = {},
}
