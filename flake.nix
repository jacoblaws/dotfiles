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

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    username = "jvl";
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ./hosts/desktop];
        specialArgs = { inherit inputs username system; };
      };

      laptop = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts ./hosts/laptop ];
        specialArgs = { inherit inputs username system; };
      };
    };

    homeConfigurations = {
      "${username}@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home ./home/profiles/desktop ];
        extraSpecialArgs = { inherit inputs username system; };
      };

      "${username}@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home ./home/profiles/laptop ];
          extraSpecialArgs = { inherit inputs username system; };
      };
    };
  };
}
