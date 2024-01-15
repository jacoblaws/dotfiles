{
  imports = [
    ./neovim.nix
    ./packages.nix
  ];

  programs = {
    kitty.enable = true;
  };

  xdg.configFile = {
    hypr.source = ../hypr;
    kitty.source = ../kitty;
  };
}
