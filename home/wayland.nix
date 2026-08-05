{ inputs, self, ... }: {
  flake.nixosModules.wayland = {
    imports = with self.nixosModules; [
      gtk
      hyprland
      niri
      noctalia
      noctalia-greeter
    ];
  };

  flake.nixosModules.gtk =
    {
      cfgPath,
      pkgs,
      themes,
      utl,
      ...
    }:
    let
      settings =
        themeName: # ini
        ''
          [Settings]
          gtk-application-prefer-pal-theme = 1
          gtk-cursor-theme-name = Qogir
          gtk-cursor-theme-size = 24
          gtk-font-name = Recursive Sans Linear Static
          gtk-icon-theme-name = Papirus
          gtk-theme-name = ${themeName}
        '';

      gtkCss = # css
        ''
          @import url("styles/main.css");
        '';
    in
    {
      hjem.users.jvl = {
        packages = with pkgs; [
          adw-gtk3
          gtk3
          gtk4
          papirus-icon-theme
          qogir-icon-theme
        ];

        xdg.config.files = {
          "gtk-3.0/settings.ini".text = settings "adw-gtk3";
          "gtk-3.0/gtk.css".text = gtkCss;
          "gtk-3.0/themes/everforest-dark".text = utl.theme.toGtkCss themes.everforest.dark;
          "gtk-3.0/themes/everforest-light".text = utl.theme.toGtkCss themes.everforest.light;
          "gtk-3.0/styles/main.css".source = cfgPath "gtk3/main.css";
          "gtk-3.0/styles/nemo.css".source = cfgPath "gtk3/nemo.css";

          "gtk-4.0/settings.ini".text = settings "Adwaita";
          "gtk-4.0/gtk.css".text = gtkCss;
          "gtk-4.0/themes/everforest-dark".text = utl.theme.toGtkCss themes.everforest.dark;
          "gtk-4.0/themes/everforest-light".text = utl.theme.toGtkCss themes.everforest.dark;
          "gtk-4.0/styles/main.css".source = cfgPath "gtk4/main.css";
        };
      };
    };

  flake.nixosModules.hyprland = { cfgPath, pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.hyprland ];
      xdg.config.files = {
        "hypr/hyprland.lua".source = cfgPath "hyprland/hyprland.lua";
        "hypr/keybinds.lua".source = cfgPath "hyprland/keybinds.lua";
      };
    };
  };

  flake.nixosModules.niri = { cfgPath, pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ pkgs.niri ];
      xdg.config.files = {
        "niri/config.kdl".source = cfgPath "niri/config.kdl";
      };
    };
  };

  flake.nixosModules.noctalia =
    { cfgPath, themes, ... }:
    let
      themeSpec =
        dark: light: # json
        ''
          {
            "dark": {
              "mPrimary": "#${dark.green}",
              "mOnPrimary": "#${dark.bgd}",
              "mSecondary": "#${dark.yellow}",
              "mOnSecondary": "#${dark.bgd}",
              "mTertiary": "#${dark.grey0}",
              "mOnTertiary": "#${dark.bgd}",

              "mSurface": "#${dark.bgd}",
              "mOnSurface": "#${dark.fg}",
              "mSurfaceVariant": "#${dark.bg0}",
              "mOnSurfaceVariant": "#${dark.grey1}",

              "mOutline": "#${dark.grey0}",
              "mShadow": "#${dark.bg3}",
              "mHover": "#${dark.bg2}",
              "mOnHover": "#${dark.yellow}",

              "mError": "#${dark.red}",
              "mOnError": "#${dark.bgd}",

              "terminal": {
                "background": "#${dark.bg0}",
                "foreground": "#${dark.fg}",
                "cursor": "#${dark.fg}",
                "cursorText": "#${dark.bg0}",
                "selectionBg": "#${dark.bgv}",
                "selectionFg": "#${dark.bg0}",

                "normal": {
                  "black": "#${dark.bgd}",
                  "red": "#${dark.red}",
                  "green": "#${dark.green}",
                  "yellow": "#${dark.yellow}",
                  "blue": "#${dark.blue}",
                  "magenta": "#${dark.magenta}",
                  "cyan": "#${dark.cyan}",
                  "white": "#${dark.fg}"
                },

                "bright": {
                  "black": "#${dark.bgd}",
                  "red": "#${dark.red}",
                  "green": "#${dark.green}",
                  "yellow": "#${dark.yellow}",
                  "blue": "#${dark.blue}",
                  "magenta": "#${dark.magenta}",
                  "cyan": "#${dark.cyan}",
                  "white": "#${dark.fg}"
                }
              }
            },

            "light": {
              "mPrimary": "#${dark.bg0}",
              "mOnPrimary": "#${light.bgd}",
              "mSecondary": "#${dark.bg5}",
              "mOnSecondary": "#${light.bgd}",
              "mTertiary": "#${light.green}",
              "mOnTertiary": "#${light.bgd}",

              "mSurface": "#${light.bgd}",
              "mOnSurface": "#${dark.bg0}",
              "mSurfaceVariant": "#${light.bg0}",
              "mOnSurfaceVariant": "#${dark.bg5}",

              "mOutline": "#${light.grey1}",
              "mShadow": "#${light.bg3}",
              "mHover": "#${dark.bg5}",
              "mOnHover": "#${light.bgd}",

              "mError": "#${light.red}",
              "mOnError": "#${light.bgd}",

              "terminal": {
                "background": "#${light.bg0}",
                "foreground": "#${light.fg}",
                "cursor": "#${light.fg}",
                "cursorText": "#${light.bg0}",
                "selectionBg": "#${light.bgv}",
                "selectionFg": "#${light.bg0}",

                "normal": {
                  "black": "#${light.bg0}",
                  "red": "#${light.red}",
                  "green": "#${light.green}",
                  "yellow": "#${light.yellow}",
                  "blue": "#${light.blue}",
                  "magenta": "#${light.magenta}",
                  "cyan": "#${light.cyan}",
                  "white": "#${light.fg}"
                },

                "bright": {
                  "black": "#${light.bg0}",
                  "red": "#${light.red}",
                  "green": "#${light.green}",
                  "yellow": "#${light.yellow}",
                  "blue": "#${light.blue}",
                  "magenta": "#${light.magenta}",
                  "cyan": "#${light.cyan}",
                  "white": "#${light.fg}"
                }
              }
            }
          }
        '';
    in
    {
      hjem.extraModules = [ inputs.noctalia.hjemModules.default ];
      hjem.users.jvl = {
        programs.noctalia.enable = true;
        xdg.config.files = {
          "noctalia/bar.toml".source = cfgPath "noctalia/bar.toml";
          "noctalia/shell.toml".source = cfgPath "noctalia/shell.toml";
          "noctalia/palettes/Everforest.json".text = themeSpec themes.everforest.dark themes.everforest.light;
        };
      };
    };

  flake.nixosModules.noctalia-greeter =
    {
      pkgs,
      themes,
      ...
    }:
    let
      pal = themes.everforest.dark;
    in
    {
      imports = [ inputs.noctalia-greeter.nixosModules.default ];
      programs.noctalia-greeter = {
        enable = true;
        settings = {
          session.default = "hyprland";
          appearance = {
            scheme = "Everforest";
            password_style = "default";
            hide_logo = true;
            theme_mode = "dark";
            corner_radius_scale = 14;
            font_family = "Resursive Sans Linear Static";
            wallpaper = {
              path = "/home/jvl/media/images/wallpapers/current.png";
              fill_mode = "center";
            };
            palette = {
              primary = "#${pal.green}";
              on_primary = "#${pal.bgd}";
              secondary = "#${pal.yellow}";
              on_secondary = "#${pal.bgd}";
              tertiary = "#${pal.grey0}";
              on_tertiary = "#${pal.bgd}";
              error = "#${pal.red}";
              on_error = "#${pal.bgd}";

              surface = "#${pal.bgd}";
              on_surface = "#${pal.fg}";
              surface_variant = "#${pal.bg0}";
              on_surface_variant = "#${pal.grey1}";

              outline = "#${pal.grey0}";
              shadow = "#${pal.bg3}";
              hover = "#${pal.bg2}";
              on_hover = "#${pal.yellow}";
            };
          };
          cursor = {
            theme = "Qogir";
            size = 24;
            package = pkgs.qogir-icon-theme;
          };
          keyboard.layout = "us";
        };
      };
    };
}
