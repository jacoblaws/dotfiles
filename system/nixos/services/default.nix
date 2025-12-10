{ config, lib, pkgs, ... }:
let theme = config.themes.everforest.dark;
in {
  services = {
    geoclue2.enable = true;
    gvfs.enable = true;
    tuned.enable = true;
    udisks2.enable = true;
    upower.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
    };

    displayManager.ly = {
      enable = true;
      settings = {
        bigclock = "en";
        brightness_down_key = "null";
        brightness_up_key = "null";
        bugclock_12hr = true;
        default_input = "password";
        hide_key_hints = true;
        hide_version_string = true;
        text_in_center = true;
        xinitrc = "null";

        bg = "0x${theme.bg0}";
        fg = "0x${theme.fg}";
        error_bg = "0x${theme.bg0}";
        error_fg = "0x${theme.red}";
        border_fg = "0x${theme.grey0}";
      };
    };

    keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
        settings.main = { capslock = "overload(control, esc)"; };
      };
    };

    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr2 ];
    };

    pulseaudio.enable = lib.mkForce false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
  };
}

