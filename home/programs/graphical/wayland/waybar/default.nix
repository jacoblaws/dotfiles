{ osConfig, ... }: {
  imports = [
    ./themes/${osConfig.currentTheme}.nix
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "8 8 0 8";

        modules-left = [
          "custom/launcher"
          "custom/separator"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "custom/separator"
          "pulseaudio"
          "network"
          "custom/power"
        ];

        "custom/launcher" = {
          format = " <span></span> ";
          on-click = "anyrun";
          on-click-right = "killall rofi";
        };

        clock = {
          format = " <span rise='0.2pt'></span> {:%H:%M} ";
        };

        pulseaudio = {
          format = " <span rise='0.2pt'>{icon}</span> {volume}% ";
          format-muted = " <span rise='0.2pt'></span> ";
          format-icons = ["" "" "" ""];
          states = {
            off = 0;
            low = 25;
            medium = 50;
            high = 75;
          };
          on-click = "pavucontrol";
          on-click-right = "helvum";
        };

        network = {
          format-wifi = " <span rise='0.2pt'></span> {signalStrength}% ";
        };

        "custom/power" = {
          format = " <span rise='0.2pt'></span> ";
          on-click = "exec $HOME/.config/waybar/scripts/power-menu.sh";
          tooltip = false;
        };

        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

      };
    };

    style = ''
      @import "themes/current.css";

      * {
        border: none;
        margin: 0;
        padding: 0;
        font-size: 14px;
        font-family: "Rec Mono Casual", "Symbols Nerd Font";
      }

      window#waybar {
        border-radius: 12px;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        margin: 3px;
      }

      #custom-launcher {
        font-size: 21px;
        margin: 0 3px 0 2px;
      }

      #workspaces button {
        margin: 0px 3px 0px 3px;
      }

      #workspaces button:first-child {
        margin-left: 6px;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        transition: none;
        font-weight: bolder;
      }

      #workspaces button.active {
        font-weight: 800;
      }

      #tray {
        margin-left: 8px;
      }

      #custom-power {
        font-weight: 700;
      }

      #clock span,
      #pulseaudio span,
      #network span {
        font-weight: 700;
      }
    '';
  };
}
