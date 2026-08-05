{
  flake.nixosModules.programs = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.git ];
    programs = {
      bash.enable = true;
      fish.enable = true;
      zsh.enable = true;
      hyprland.enable = true;
      niri.enable = true;
      xwayland.enable = true;

      appimage = {
        enable = true;
        binfmt = true;
      };

      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep 5 --keep-since 1w --nogcroots";
        flake = "/home/jvl/dotfiles";
      };

      steam = {
        enable = true;
        protontricks.enable = true;
        gamescopeSession.enable = true;

        extraCompatPackages = with pkgs; [ proton-ge-bin ];
      };

      gamescope = {
        enable = true;
        capSysNice = false;
        args = [
          "--rt"
          "--expose-wayland"
        ];
      };
    };

    services = {
      geoclue2.enable = true;
      gvfs.enable = true;
      tuned.enable = true;
      udisks2.enable = true;
      upower.enable = true;

      ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-cpp;
        extraRules = [
          {
            "name" = "gamescope";
            "nice" = -20;
          }
        ];
      };

      avahi = {
        enable = true;
        nssmdns4 = true;
      };

      # displayManager.ly = {
      #   enable = true;
      #   settings = {
      #     bigclock = "en";
      #     brightness_down_key = "null";
      #     brightness_up_key = "null";
      #     default_input = "password";
      #     hide_key_hints = true;
      #     hide_version_string = true;
      #     text_in_center = true;
      #     xinitrc = "null";
      #
      #     # bg = "0x${theme.bg0}";
      #     # fg = "0x${theme.fg}";
      #     # error_bg = "0x${theme.bg0}";
      #     # error_fg = "0x${theme.red}";
      #     # border_fg = "0x${theme.grey0}";
      #   };
      # };

      keyd = {
        enable = true;
        keyboards.default = {
          ids = [ "*" ];
          settings.main = {
            capslock = "overload(control, esc)";
          };
        };
      };

      printing = {
        enable = true;
        drivers = [ pkgs.epson-escpr2 ];
      };

    };

    xdg.portal.wlr.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
