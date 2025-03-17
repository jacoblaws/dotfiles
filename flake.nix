{
  description = "nixos and home-manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    username = "jvl";
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [
          ./hosts
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home/profiles/desktop;
            home-manager.extraSpecialArgs = { inherit inputs username system; };
          }
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [
          ./hosts
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home/profiles/laptop;
            home-manager.extraSpecialArgs = { inherit inputs username system; };
          }
        ];
      };
    };
  };
}
