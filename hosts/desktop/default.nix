{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
}
