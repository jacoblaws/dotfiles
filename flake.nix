{
  description = "NixOS and Home-Manager flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./hosts ./modules ];
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, ... }: {
        devShells = let nixTools = with pkgs; [ nixd nixfmt-classic statix ];
        in {
          default = pkgs.mkShell {
            name = "dotfiles";
            packages = nixTools;
          };

          haskell = pkgs.mkShell {
            name = "dotfiles-haskell";
            packages = with pkgs.haskell.packages.ghc912;
              [
                (ghc.withPackages (p: [ optparse-applicative ]))
                haskell-language-server
                fourmolu
              ] ++ nixTools;
          };

          lua = pkgs.mkShell {
            name = "dotfiles-lua";
            packages = with pkgs; [ lua-language-server stylua ] ++ nixTools;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
  };
}
