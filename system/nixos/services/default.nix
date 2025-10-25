{ lib, pkgs, ... }: {
  imports = [ ./greetd.nix ];

  services = {
    geoclue2.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
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

