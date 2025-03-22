{
  imports = [
    ./home-manager.nix
    ./nh.nix
    ./substituters.nix
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;
}
