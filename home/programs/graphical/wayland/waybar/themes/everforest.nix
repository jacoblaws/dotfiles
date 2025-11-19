{ osConfig, ... }: let
  inherit (osConfig) theme currentTheme;
  inherit (theme.${currentTheme}) dark light;
in {
  home.file.".config/waybar/themes/everforest-dark.css".text = ''
    window#waybar {
      color: #${dark.fg};
    }

    .modules-left,
    .modules-center,
    .modules-right {
      background: transparent;
    }

    #custom-launcher {
      color: #${dark.green};
    }

    #workspaces button {
      color: #${dark.fg}
    }

    #workspaces button:hover {
      color: #${dark.yellow};
      background: transparent;
    }

    #workspaces button.active {
      color: #${dark.yellow};
    }

    #custom-power {
      color: #${dark.red};
    }

    #custom-separator {
      color: #${dark.grey0};
    }

    #clock span,
    #pulseaudio span,
    #network span {
      color: #${dark.yellow};
    }
  '';

  home.file.".config/waybar/themes/everforest-light.css".text = ''
  '';
}
