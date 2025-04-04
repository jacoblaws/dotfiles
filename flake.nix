{
  description = "NixOS and Home-Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:/hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    programsdb = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
    hyprland.url = "github:hyprwm/hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./hosts
      ];

      systems = [ "x86_64-linux" ];

      perSystem = { config, pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          name = "dotfiles";
          packages = with pkgs; [
            nil
            nixfmt-classic
            lua-language-server
            stylua
          ];
        };
      };
    };
}
