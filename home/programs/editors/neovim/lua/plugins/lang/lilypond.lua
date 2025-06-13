local plugin = {
  'martineausimon/nvim-lilypond-suite',
  event = "BufRead *.ly",
}

plugin.opts = {
  lilypond = {
    options = {
      pitches_language = 'default',
      hypenation_language = 'en_DEFAULT',
      output = 'pdf',
    },
  },
};

return plugin
