{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };
}
