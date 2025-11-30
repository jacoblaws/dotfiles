{ osConfig, pkgs, ... }:
let
  inherit (osConfig) themes defaultTheme;
  palette = themes.${defaultTheme}.dark;
in {
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      default_tab_template {
        pane size=1 borderless=true {
          plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
            color_fg      "#${palette.fg}"
            color_bgd     "#${palette.bgd}"
            color_bg0     "#${palette.bg0}"
            color_red     "#${palette.red}"
            color_orange  "#${palette.orange}"
            color_yellow  "#${palette.yellow}"
            color_green   "#${palette.green}"
            color_cyan    "#${palette.cyan}"
            color_blue    "#${palette.blue}"
            color_magenta "#${palette.magenta}"

            format_left   "{mode}#[bg=$bgd] {tabs}"
            format_center "#[bg=$bgd]"
            format_right  "#[bg=$bgd,fg=$green]◖#[bg=$green,fg=$bgd] #[bg=$green,fg=$bgd,bold]{session}#[bg=$bg0,fg=$green]◗"
            format_space  "#[bg=$bgd]"
            format_hide_on_overlength "true"
            format_precendence "lrc"

            mode_normal "#[bg=$bgd,fg=$green]◖#[bg=$green,fg=$bgd,bold]NORMAL#[bg=$bgd,fg=$green]◗"
            mode_locked "#[bg=$bgd,fg=$red]◖#[bg=$red,fg=$bgd,bold]LOCKED#[bg=$bgd,fg=$red]◗"

            tab_separator "#[bg=$bgd] "

            tab_normal "#[bg=$bgd,fg=$fg]󰄰 #[bg=$bgd,fg=$fg]{name}"
            tab_active "#[bg=$bgd,fg=$yellow]󰄯 #[bg=$bgd,fg=$yellow]{name}"
          }
        }
        children
      }
    }
  '';
}
