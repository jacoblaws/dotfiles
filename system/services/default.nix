{ pkgs, ... }: {
  imports = [
    ./xorg
    ./xorg/awesome.nix
    ./greetd.nix
    ./keyd.nix
    ./pipewire.nix
  ];

  services = {
    gvfs.enable = true;
    udisks2.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
    };

    printing = {
      enable = true;
      drivers = [ pkgs.epson-escpr2 ];
    };
  };
}
