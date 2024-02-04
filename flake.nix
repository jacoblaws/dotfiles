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

    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    username = "jvl";
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        modules = [ ./config/nixos/configuration.nix ];
        specialArgs = { inherit inputs username system; };
      };
    };

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home.nix ];
      extraSpecialArgs = { inherit inputs username; };
    };
  };
}
