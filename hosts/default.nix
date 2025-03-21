{ self, inputs, ... }: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    importHome = import "${self}/home/profiles";
    specialArgs = {
      inherit self inputs;
      system = "x86_64-linux";
    };
  in {
    desktop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./desktop
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.desktop;
          };
        }
      ];
    };

    laptop = nixosSystem {
      inherit specialArgs;
      modules = [
        ./laptop
        inputs.home-manager.nixosModules.home-manger
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.jvl.imports = importHome.laptop;
          };
        }
      ];
    };
  };
}
