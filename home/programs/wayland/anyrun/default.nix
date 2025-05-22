{ inputs, pkgs, osConfig, ... }: let
  theme = osConfig.theme;
  colors = theme.palette.${theme.name}.colors;
in {
  programs.anyrun = {
    enable = true;

    config = {
      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.3;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;

      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
      ];
    };

    extraCss = ''
      * {
        all: unset;
        font-family: "Rec Mono Static", "Symbols Nerd Font Mono";
        font-size: 12pt;
      }

      box#main {
        background: #${colors.bgd};
        border-color: #${colors.yellow};

        border-style: solid;
        border-width: 2px;
        border-radius: 12px;
      }

      #entry {
        color: #${colors.yellow};
        background: #${colors.bg0};

        margin: 0.7rem;
        padding: 0.5rem;
        border-radius: 7px;
      }

      #match.activatable {
        color: #${colors.fg};
        margin: 0 0.7rem 0 0.7rem;
        background: #${colors.bg0};
      }

      #match.activatable:first-child {
        border-radius: 7px 7px 0 0;
      }

      #match.activatable:last-child {
        margin: 0 0.7rem 0.7rem 0.7rem;
        border-radius: 0 0 7px 7px;
      }

      #match.activatable:only-child {
        margin: 0 0.7rem 0.7rem 0.7rem;
        border-radius: 7px;
      }

      #match:hover,
      #match:selected {
        color: #${colors.green};
      }

      image {
        -gtk-icon-transform: scale(0.7);
        margin: 0;
        padding: 0 0 0 0.3rem;
      }
    '';
  };
}
