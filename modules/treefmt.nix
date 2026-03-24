{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem = {
    treefmt = {
      programs = {
        fourmolu.enable = true;
        nixfmt.enable = true;
        prettier.enable = true;
        stylua.enable = true;
      };

      settings.excludes = [
        "flake.lock"
        "**/nvim-pack-lock.json"
      ];
    };
  };
}
