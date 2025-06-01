{ osConfig, ... }: let
  inherit (osConfig) theme currentTheme;
  palette = theme.${currentTheme}.dark;
in {
  xdg.configFile."zellij/theme/custom.kdl".text = ''
    custom {
      text_unselected {
        base       "#${palette.bg0}"
        background "#${palette.bg0}"
        emphasis_0 "#${palette.orange}"
        emphasis_1 "#${palette.blue}"
        emphasis_2 "#${palette.green}"
        emphasis_3 "#${palette.magenta}"
      }
      text_unselected {
         base       "#${palette.yellow}"
         background "#${palette.bg0}"
         emphasis_0 "#${palette.orange}"
         emphasis_1 "#${palette.blue}"
         emphasis_2 "#${palette.green}"
         emphasis_3 "#${palette.magenta}"
       }
       text_selected {
         base       "#${palette.red}"
         background "#${palette.bgd}"
         emphasis_0 "#${palette.orange}"
         emphasis_1 "#${palette.blue}"
         emphasis_2 "#${palette.green}"
         emphasis_3 "#${palette.magenta}"
       }
       ribbon_unselected {
         base       "#${palette.fg}"
         background "#${palette.bg2}"
         emphasis_0 "#${palette.orange}"
         emphasis_1 "#${palette.blue}"
         emphasis_2 "#${palette.green}"
         emphasis_3 "#${palette.magenta}"
       }
       ribbon_selected {
         base       "#${palette.bgd}"
         background "#${palette.green}"
         emphasis_0 "#${palette.orange}"
         emphasis_1 "#${palette.blue}"
         emphasis_2 "#${palette.green}"
         emphasis_3 "#${palette.magenta}"
       }
       frame_highlight  {
         base       "${palette.orange}"
         background "${palette.bg0}"
         emphasis_0 "${palette.orange}"
         emphasis_1 "${palette.blue}"
         emphasis_2 "${palette.green}"
         emphasis_3 "${palette.magenta}"
       }
    }
  '';
}
