{ osConfig, lib, ... }:
let
  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles;
  spec = theme: ''
    background              ${theme.bg0}
    foreground              ${theme.fg}
    selection_foreground    ${theme.grey2}
    selection_background    ${theme.bg4}

    cursor                  ${theme.fg}
    cursor_text_color       ${theme.bg1}

    active_border_color     ${theme.green}
    inactive_border_color   ${theme.bg5}
    bell_border_color       ${theme.orange}
    visual_border_color     none

    wayland_titlebar_color  system
    macos_titlebar_color    system

    active_tab_foreground   ${theme.fg}
    active_tab_background   ${theme.bgd}
    inactive_tab_foreground ${theme.grey2}
    inactive_tab_background ${theme.bg2}
    tab_bar_background      ${theme.bg2}
    tab_bar_margin_color    none

    mark1_foreground        ${theme.bg0}
    mark1_background        ${theme.blue}
    mark2_foreground        ${theme.bg0}
    mark2_background        ${theme.yellow}
    mark3_foreground        ${theme.bg0}
    mark3_background        ${theme.magenta}

    color0                  ${theme.bg1}
    color1                  ${theme.red}
    color2                  ${theme.green}
    color3                  ${theme.yellow}
    color4                  ${theme.blue}
    color5                  ${theme.magenta}
    color6                  ${theme.cyan}
    color7                  ${theme.fg}
    color8                  ${theme.bg1}
    color9                  ${theme.red}
    color10                 ${theme.green}
    color11                 ${theme.yellow}
    color12                 ${theme.blue}
    color13                 ${theme.magenta}
    color14                 ${theme.cyan}
    color15                 ${theme.fg}
  '';
in genFiles ".config/kitty/themes" ".conf" spec themes
