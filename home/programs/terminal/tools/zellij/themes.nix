{ lib, osConfig, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles;
  spec = pal: # kdl
    ''
      themes {
        custom {
          frame_unselected {
            base       "#${pal.bgd}"
            background "#${pal.bg0}"
            emphasis_0 "#${pal.orange}"
            emphasis_1 "#${pal.blue}"
            emphasis_2 "#${pal.green}"
            emphasis_3 "#${pal.magenta}"
          }

          frame_selected {
            base       "#${pal.bgd}"
            background "#${pal.bg0}"
            emphasis_0 "#${pal.orange}"
            emphasis_1 "#${pal.blue}"
            emphasis_2 "#${pal.green}"
            emphasis_3 "#${pal.magenta}"
          }

          frame_highlight {
            base       "#${pal.yellow}"
            background "#${pal.bg0}"
            emphasis_0 "#${pal.orange}"
            emphasis_1 "#${pal.blue}"
            emphasis_2 "#${pal.green}"
            emphasis_3 "#${pal.magenta}"
          }
        }
      }
    '';
in genFiles ".config/zellij/themes" "" spec themes
