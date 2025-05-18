{ config, ... }:

{
  imports = [
    ./packages.nix
  ];

  home = {
    username = "jvl";
    homeDirectory = "/home/jvl";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
