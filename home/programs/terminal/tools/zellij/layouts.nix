{ lib, osConfig, pkgs, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles;
  spec = pal: # kdl
    ''
      layout {
        default_tab_template {
          pane size=1 borderless=true {
            plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
              format_left   "{mode}#[bg=#${pal.bgd},fg=#${pal.bg5}]  {tabs}"
              format_center ""
              format_right  "#[bg=#${pal.bgd},fg=#${pal.bg5}]󰧾 {session}"
              format_space  "#[bg=#${pal.bgd}]"

              tab_normal    "#[bg=#${pal.bgd},fg=#${pal.bg5}] {name}"
              tab_active    "#[bg=#${pal.bgd},fg=#${pal.yellow}] {name}"
              tab_separator "#[bg=#${pal.bgd}] "

              mode_normal        "#[bg=#${pal.bgd},fg=#${pal.green}]󰌪"
              mode_locked        "#[bg=#${pal.bgd},fg=#${pal.red}]󰌪"
              mode_resize        "#[bg=#${pal.bgd},fg=#${pal.orange}]󰩨"
              mode_pane          "#[bg=#${pal.bgd},fg=#${pal.blue}]󰓫"
              mode_move          "#[bg=#${pal.bgd},fg=#${pal.green}]󰆾"
              mode_tab           "#[bg=#${pal.bgd},fg=#${pal.magenta}]󰣆"
              mode_scroll        "#[bg=#${pal.bgd},fg=#${pal.green}]󰹺"
              mode_search        "#[bg=#${pal.bgd},fg=#${pal.cyan}]󰍉"
              mode_enter_search  "#[bg=#${pal.bgd},fg=#${pal.cyan}]󱁴"
              mode_rename_tab    "#[bg=#${pal.bgd},fg=#${pal.magenta}]󰂮"
              mode_rename_pane   "#[bg=#${pal.bgd},fg=#${pal.blue}]󰓰"
              mode_session       "#[bg=#${pal.bgd},fg=#${pal.green}]󰌨"
              mode_prompt        "#[bg=#${pal.bgd},fg=#${pal.green}]󰘧"
              mode_tmux          "#[bg=#${pal.bgd},fg=#${pal.green}]󰎂"
            }
          }
          children
        }
      }
    '';
in genFiles ".config/zellij/layouts" "" spec themes
