{ osConfig, ... }: let
  inherit (osConfig) currentTheme theme;
  inherit (theme.${currentTheme}) dark light;
in {
  home.file.".config/kitty/themes/everforest-dark.conf".text = ''
    foreground              #${dark.fg}
    background              #${dark.bg0}
    selection_foreground    #${dark.grey2}
    selection_background    #${dark.bg4}

    cursor                  #${dark.fg}
    cursor_text_color       #${dark.bg1}

    url_color               #${dark.blue}

    active_border_color     #${dark.green}
    inactive_border_color   #${dark.bg5}
    bell_border_color       #${dark.orange}
    visual_border_color     none

    wayland_titlebar_color  system
    macos_titlebar_color    system

    active_tab_foreground   #${dark.fg}
    active_tab_background   #${dark.bgd}
    inactive_tab_foreground #${dark.grey2}
    inactive_tab_background #${dark.bg2}
    tab_bar_background      #${dark.bg1}
    tab_bar_margin_color    none

    mark1_foreground        #${dark.bg0}
    mark1_background        #${dark.blue}
    mark2_foreground        #${dark.bg0}
    mark2_background        #${dark.yellow}
    mark3_foreground        #${dark.bg0}
    mark3_background        #${dark.magenta}

    # black
    color0 #${dark.bg1}
    color8 #${dark.bg1}

    # red
    color1 #${dark.red}
    color9 #${dark.red}

    # green
    color2  #${dark.green}
    color10 #${dark.green}

    # yellow
    color3  #${dark.yellow}
    color11 #${dark.yellow}

    # blue
    color4  #${dark.blue}
    color12 #${dark.blue}

    # magenta
    color5  #${dark.magenta}
    color13 #${dark.magenta}

    # cyan
    color6  #${dark.cyan}
    color14 #${dark.cyan}

    # white
    color7  #${dark.fg}
    color15 #${dark.fg}
  '';

  home.file.".config/kitty/themes/everforest-light.conf".text = ''
    foreground              #${light.fg}
    background              #${light.bg0}
    selection_foreground    #${light.grey2}
    selection_background    #${light.bg4}

    cursor                  #${light.fg}
    cursor_text_color       #${light.bg1}

    url_color               #${light.blue}

    active_border_color     #${light.green}
    inactive_border_color   #${light.bg5}
    bell_border_color       #${light.orange}
    visual_border_color     none

    wayland_titlebar_color  system
    macos_titlebar_color    system

    active_tab_foreground   #${light.fg}
    active_tab_background   #${light.bgd}
    inactive_tab_foreground #${light.grey2}
    inactive_tab_background #${light.bg2}
    tab_bar_background      #${light.bg1}
    tab_bar_margin_color    none

    mark1_foreground        #${light.bg0}
    mark1_background        #${light.blue}
    mark2_foreground        #${light.bg0}
    mark2_background        #${light.yellow}
    mark3_foreground        #${light.bg0}
    mark3_background        #${light.magenta}

    # black
    color0 #${light.bg1}
    color8 #${light.bg1}

    # red
    color1 #${light.red}
    color9 #${light.red}

    # green
    color2  #${light.green}
    color10 #${light.green}

    # yellow
    color3  #${light.yellow}
    color11 #${light.yellow}

    # blue
    color4  #${light.blue}
    color12 #${light.blue}

    # magenta
    color5  #${light.magenta}
    color13 #${light.magenta}

    # cyan
    color6  #${light.cyan}
    color14 #${light.cyan}

    # white
    color7  #${light.fg}
    color15 #${light.fg}
  '';

}
