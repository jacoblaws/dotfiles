{ self, ... }: {
  flake.nixosModules.office = {
    imports = with self.nixosModules; [
      sioyek
      zathura
    ];
  };

  flake.nixosModules.sioyek = { pkgs, themes, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.sioyek ];
      xdg.config.files."sioyek/prefs_user.config".text =
        let
          pal = themes.everforest.dark;
        in
        ''
          # Config options
          startup_commands toggle_custom_color;toggle_statusbar
          font_size 16
          ui_font Recursive Sans Linear Static
          collapsed_toc 1
          should_launch_new_window 1

          # Theme
          custom_text_color #${pal.fg}
          custom_background_color #${pal.bg0}
          custom_color_mode_empty_background_color #${pal.bgd}

          page_separator_width 10
          page_separator_color #${pal.bgd}

          status_bar_color #${pal.bgd}
          status_bar_text_color #${pal.yellow}
          status_bar_font_size 12

          ui_text_color #${pal.fg}
          ui_background_color #${pal.bgd}

          ui_selected_text_color #${pal.green}
          ui_selected_background_color #${pal.bg0}

          search_highlight_color #${pal.magenta}
        '';
    };
  };

  flake.nixosModules.zathura = { pkgs, themes, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.zathura ];
      xdg.config.files."zathura/zathurarc".text =
        let
          pal = themes.everforest.dark;
        in
        ''
          set window-title-basename true
          set selection-clipboard "clipboard"
          set font "Recursive Sans Linear Static"

          # Theme
          set notification-error-bg   "#${pal.bg0}"
          set notification-error-fg   "#${pal.red}"
          set notification-warning-bg "#${pal.bg0}"
          set notification-warning-fg "#${pal.orange}"
          set notification-bg         "#${pal.bg0}"
          set notification-fg         "#${pal.green}"

          set completion-bg           "#${pal.bg1}"
          set completion-fg           "#${pal.fg}"
          set completion-group-bg     "#${pal.bg2}"
          set completion-group-fg     "#${pal.grey0}"
          set completion-highlight-bg "#${pal.blue}"
          set completion-highlight-fg "#${pal.bg2}"

          set index-bg                "#${pal.bg0}"
          set index-fg                "#${pal.fg}"
          set index-active-bg         "#${pal.bg1}"
          set index-active-fg         "#${pal.yellow}"

          set inputbar-bg             "#${pal.bgd}"
          set inputbar-fg             "#${pal.fg}"

          set statusbar-bg            "#${pal.bgd}"
          set statusbar-fg            "#${pal.fg}"

          set highlight-color         "#${pal.green}"
          set highlight-active-color  "#${pal.yellow}"

          set default-bg              "#${pal.bg0}"
          set default-fg              "#${pal.fg}"

          set render-loading          true
          set render-loading-fg       "#${pal.bg0}"
          set render-loading-bg       "#${pal.fg}"

          set recolor-lightcolor      "#${pal.bg0}"
          set recolor-darkcolor       "#${pal.fg}"

          # startup options
          set adjust-open "width"
          set recolor true
          set recolor-keephue true
        '';
    };
  };
}
