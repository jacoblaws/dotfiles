{
  imports = [ ./treefmt.nix ];
  flake.nixosModules = {
    themes = import ./themes;
  };
}
