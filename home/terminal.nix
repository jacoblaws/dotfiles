{ self, ... }: {
  flake.nixosModules.terminal = {
    imports = with self.nixosModules; [
      fish
      ghostty
      kitty
      starship
      tmux
      zellij
    ];
  };

  flake.nixosModules.fish = { cfgPath, pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.fish ];
      xdg.config.files."fish/config.fish".source = cfgPath "config.fish";
    };
  };

  flake.nixosModules.ghostty =
    {
      cfgPath,
      pkgs,
      themes,
      ...
    }:
    {
      hjem.users.jvl = {
        packages = [ pkgs.ghostty ];
        xdg.config.files."ghostty/config.ghostty".source = cfgPath "config.ghostty";
        xdg.config.files."ghostty/themes/everforest-dark".text =
          let
            pal = themes.everforest.dark;
          in
          ''
            background = #${pal.bg0}
            foreground = #${pal.fg}
            cursor-color = #${pal.fg}
            cursor-text = #${pal.bg0}
            selection-background = #${pal.bgv}
            selection-foreground = #${pal.bg0}
            palette = 0=#${pal.bgd}
            palette = 1=#${pal.red}
            palette = 2=#${pal.green}
            palette = 3=#${pal.yellow}
            palette = 4=#${pal.blue}
            palette = 5=#${pal.magenta}
            palette = 6=#${pal.cyan}
            palette = 7=#${pal.fg}
            palette = 8=#${pal.bg0}
            palette = 9=#${pal.red}
            palette = 10=#${pal.green}
            palette = 11=#${pal.yellow}
            palette = 12=#${pal.blue}
            palette = 13=#${pal.magenta}
            palette = 14=#${pal.cyan}
            palette = 15=#${pal.fg}
          '';
      };
    };

  flake.nixosModules.kitty =
    {
      cfgPath,
      pkgs,
      themes,
      ...
    }:
    {
      hjem.users.jvl = {
        packages = [ pkgs.kitty ];
        xdg.config.files."kitty/kitty.conf".source = cfgPath "kitty.conf";
        xdg.config.files."kitty/themes/everforest-dark".text =
          let
            pal = themes.everforest.dark;
          in
          ''
            background              #${pal.bg0}
            foreground              #${pal.fg}
            selection_foreground    #${pal.grey2}
            selection_background    #${pal.bg4}

            cursor                  #${pal.fg}
            cursor_text_color       #${pal.bg1}

            active_border_color     #${pal.green}
            inactive_border_color   #${pal.bg5}
            bell_border_color       #${pal.orange}
            visual_border_color     none

            wayland_titlebar_color  system
            macos_titlebar_color    system

            active_tab_foreground   #${pal.fg}
            active_tab_background   #${pal.bgd}
            inactive_tab_foreground #${pal.grey2}
            inactive_tab_background #${pal.bg2}
            tab_bar_background      #${pal.bg2}
            tab_bar_margin_color    none

            mark1_foreground        #${pal.bg0}
            mark1_background        #${pal.blue}
            mark2_foreground        #${pal.bg0}
            mark2_background        #${pal.yellow}
            mark3_foreground        #${pal.bg0}
            mark3_background        #${pal.magenta}

            color0                  #${pal.bg1}
            color1                  #${pal.red}
            color2                  #${pal.green}
            color3                  #${pal.yellow}
            color4                  #${pal.blue}
            color5                  #${pal.magenta}
            color6                  #${pal.cyan}
            color7                  #${pal.fg}
            color8                  #${pal.bg1}
            color9                  #${pal.red}
            color10                 #${pal.green}
            color11                 #${pal.yellow}
            color12                 #${pal.blue}
            color13                 #${pal.magenta}
            color14                 #${pal.cyan}
            color15                 #${pal.fg}
          '';
      };
    };

  flake.nixosModules.starship = { cfgPath, pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.starship ];
      xdg.config.files."starship/starship.toml".source = cfgPath "starship.toml";
    };
  };

  flake.nixosModules.tmux = { cfgPath, pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.tmux ];
      xdg.config.files."tmux/tmux.conf".source = cfgPath "tmux.conf";
    };
  };

  flake.nixosModules.zellij =
    {
      cfgPath,
      pkgs,
      themes,
      ...
    }:
    {
      hjem.users.jvl = {
        packages = [
          pkgs.zellij
          pkgs.zjstatus
        ];

        xdg.config.files =
          let
            inherit (themes.everforest) dark light;

            layoutSpec =
              pal: # kdl
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

            themeSpec =
              pal: # kdl
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
          in
          {
            "zellij/config.kdl".source = cfgPath "zellij/config.kdl";
            "zellij/layouts/everforest-dark".text = layoutSpec dark;
            "zellij/layouts/everforest-light".text = layoutSpec light;
            "zellij/themes/everforest-dark".text = themeSpec dark;
            "zellij/themes/everforest-light".text = themeSpec light;
          };
      };
    };
}
